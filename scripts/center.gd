extends Node3D

@onready var music: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	loop_music()

func loop_music() -> void:
	while true:
		music.play()
		await get_tree().create_timer(25.0).timeout
