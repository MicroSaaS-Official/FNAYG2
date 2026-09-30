extends Control

@onready var text = $laBEL
@onready var audiostreamplayer = $AudioStreamPlayer
var selected = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	audiostreamplayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		selected = 0
	elif Input.is_action_just_pressed("ui_down"):
		selected = 1
	
	if Input.is_action_just_pressed('ui_accept'):
		if selected == 0:
			Global.destination = "Error"
			Global.destinationtext = "Error: Not Implemented"
			get_tree().change_scene_to_file('res://intro.tscn')
		if selected == 1:
			Global.destination = "Center"
			Global.destinationtext = "Distribution Center"
			get_tree().change_scene_to_file('res://intro.tscn')

	if selected == 0:
		text.text = "Friday\nNights\nat\nYouth Group's\n2: Nightmare Location\n\n>> Continue\n   New Game"
	elif selected == 1:
		text.text = "Friday\nNights\nat\nYouth Group's\n2: Nightmare Location\n\n   Continue\n>> New Game"
