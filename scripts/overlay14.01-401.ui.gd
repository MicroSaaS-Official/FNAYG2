extends CanvasLayer

# Preload the jobs scene
var jobs_scene: PackedScene = preload("res://jobs.tscn")
var active_jobs_instance: Node = null

func _process(_delta: float) -> void:
	# Show or hide interaction prompt label based on global proximity state
	$Label.visible = Global.is_player_near_computer
	
	# Optional cleanup: remove the jobs menu if player walks away
	if not Global.is_player_near_computer and active_jobs_instance != null:
		active_jobs_instance.queue_free()
		active_jobs_instance = null

func _unhandled_input(event: InputEvent) -> void:
	# Only proceed if player is in the area
	if not Global.is_player_near_computer:
		return
		
	# Trigger when pressing the interact key (e.g. "ui_accept" / Enter / Space / E)
	if event.is_action_pressed("interact"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		# Check if the jobs screen isn't already spawned
		if active_jobs_instance == null:
			active_jobs_instance = jobs_scene.instantiate()
			add_child(active_jobs_instance)
