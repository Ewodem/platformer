extends Area3D

const ROTATION_SPEED = 0.05 # Speed at which the coin rotates



# Rotates coin
func _process(_delta: float) -> void:
	rotate_y(ROTATION_SPEED)

#Pcik up coin
func _on_body_entered(_body: Node3D) -> void:
	$"../../Player".jump_velocity = $"../../Player".jump_velocity*Globals.jump_mod
	$"../../Label2".coins_collected += 1
	queue_free()
