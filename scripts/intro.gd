extends Control

@onready var introtext: Label = $Label
@onready var introbgm: AudioStreamPlayer = $IntroBGM

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	introtext.text = Global.destinationtext
	introbgm.play()
	
	if Global.destination == "Error":
		return
	
	# Wait for 2 seconds before changing scenes
	await get_tree().create_timer(2.0).timeout
	
	get_tree().change_scene_to_file("res://" + Global.destination + ".tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
