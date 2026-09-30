extends CharacterBody3D

@export var speed: float = 4.0
@export var player: Node3D # Drag your Player node here in the Inspector
@export_enum("Animation", "Custom Scene") var custom_jumpscare_mode: int = 0 # Set to 1 for custom scene switch

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var anim_player: AnimationPlayer = $'Mutant Run'/AnimationPlayer # Adjust path if inside child GLB node

const WALK_ANIMATION: String = "Armature|mixamo_com|Layer0"
const JUMPSCARE_ANIMATION: String = "m/Armature_mixamo_com_Layer0"

var is_jumpscaring: bool = false

func _ready() -> void:
	call_deferred("setup_navigation")

func setup_navigation() -> void:
	await get_tree().physics_frame
	
	# If no player is assigned, trigger instant jumpscare
	if not player:
		trigger_jumpscare()
		return
		
	nav_agent.target_position = player.global_position

func _physics_process(_delta: float) -> void:
	if not player or is_jumpscaring:
		return
		
	# Update path towards player
	nav_agent.target_position = player.global_position

	if nav_agent.is_navigation_finished():
		return

	# Calculate movement direction
	var next_path_position: Vector3 = nav_agent.get_next_path_position()
	var current_agent_position: Vector3 = global_position
	var new_velocity: Vector3 = (next_path_position - current_agent_position).normalized() * speed

	velocity = new_velocity
	move_and_slide()

	# Rotate monster towards movement direction
	if velocity.length() > 0.1:
		var look_dir = Vector3(velocity.x, 0, velocity.z)
		look_at(global_position + look_dir, Vector3.UP)

	# Play walk animation safely without restarting it every frame
	if anim_player.has_animation(WALK_ANIMATION):
		if anim_player.current_animation != WALK_ANIMATION:
			anim_player.play(WALK_ANIMATION)

# Connected to Area3D body_entered signal
func _on_jumpscare_area_body_entered(body: Node3D) -> void:
	if body == player and not is_jumpscaring:
		trigger_jumpscare()

func trigger_jumpscare() -> void:
	if is_jumpscaring:
		return
		
	is_jumpscaring = true
	velocity = Vector3.ZERO
	
	print("GAME OVER: Jumpscare Triggered!")
	
	# Mode 1: Transfer straight to the custom jumpscare scene
	if custom_jumpscare_mode == 1:
		get_tree().change_scene_to_file("res://assets/models/jakob_jumpscare.tscn")
		return

	# Mode 0: Play animation, wait for finish, and switch to TITLE.tscn
	if anim_player.has_animation(JUMPSCARE_ANIMATION):
		anim_player.play(JUMPSCARE_ANIMATION)
		await anim_player.animation_finished
	else:
		await get_tree().create_timer(1.0).timeout
		
	get_tree().change_scene_to_file("res://TITLE.tscn")
