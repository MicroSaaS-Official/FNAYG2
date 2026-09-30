extends Button

@onready var parent = $'..'

func _on_pressed() -> void:
	parent.queue_free()
