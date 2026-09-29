extends Control

@onready var text = $laBEL
@onready var audiostreamplayer = $AudioStreamPlayer
var selected = 0

func _ready():
	audiostreamplayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		selected = 0
	elif Input.is_action_just_pressed("ui_down"):
		selected = 1

	if selected == 0:
		text.text = "Friday\nNights\nat\nYouth Group's\n2: Nightmare Location\n\n>> Continue\n   New Game"
	elif selected == 1:
		text.text = "Friday\nNights\nat\nYouth Group's\n2: Nightmare Location\n\n   Continue\n>> New Game"
