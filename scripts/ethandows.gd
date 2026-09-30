extends Control

# Export slot in the Inspector to assign your next scene file (.tscn)
@export var next_scene: PackedScene

@onready var aud: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var boot: CanvasLayer = $CanvasLayer

func _ready() -> void:
	aud.play()
	await get_tree().create_timer(3.5).timeout
	boot.queue_free()
	
	# Instantiate and add the exported scene if one was assigned
	if next_scene:
		var new_scene_instance = next_scene.instantiate()
		add_child(new_scene_instance)

func _unhandled_input(event: InputEvent) -> void:
	# Only process keypresses if the player is inside the Area3D
	if not Global.is_player_near_computer:
		return
