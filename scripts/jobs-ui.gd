extends Control

func _on_11_pressed() -> void:
	Global.destination = "pizzeria1"
	Global.destinationtext = "Night 1"
	Global.current_night = 1
	get_tree().change_scene_to_file('res://intro.tscn')

func _on_12_pressed() -> void:
	Global.destination = "pizzeria1"
	Global.destinationtext = "Night 2"
	Global.current_night = 2
	get_tree().change_scene_to_file('res://intro.tscn')


func _on_13_pressed() -> void:
	Global.destination = "pizzeria1"
	Global.destinationtext = "Night 3"
	Global.current_night = 3
	get_tree().change_scene_to_file('res://intro.tscn')


func _on_14_pressed() -> void:
	Global.destination = "pizzeria1"
	Global.destinationtext = "Night 4"
	Global.current_night = 4
	get_tree().change_scene_to_file('res://intro.tscn')


func _on_15_pressed() -> void:
	Global.destination = "pizzeria1"
	Global.destinationtext = "Night 5"
	Global.current_night = 3
	get_tree().change_scene_to_file('res://intro.tscn')
