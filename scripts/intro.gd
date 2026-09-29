extends Control

@onready var introtext = $Label
@onready var introbgm = $IntroBGM
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	introtext.text = Global.destinationtext
	introbgm.play()
	if Global.destination == "Error":
		return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
