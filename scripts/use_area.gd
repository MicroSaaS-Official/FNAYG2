extends Area3D

# Triggered when a node enters the Area3D collision shape
func _on_body_entered(body: Node3D) -> void:
	# Check if the colliding body is the player (adjust group name or class as needed)
	if body.is_in_group("player"):
		Global.is_player_near_computer = true
		print("Global.is_player_near_computer = true")

# Triggered when a node exits the Area3D collision shape
func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		Global.is_player_near_computer = false
		print("Global.is_player_near_computer = false")
