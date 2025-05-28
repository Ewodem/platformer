extends Control
#Return to menu
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/start_screen.tscn")
#Jump modifier
func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Globals.jump_mod = 1
	else:
		Globals.jump_mod = 1.02
