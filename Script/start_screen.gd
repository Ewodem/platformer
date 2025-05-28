extends Control

# Start_button
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/level_1.tscn")

# Settings_button
func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/settings.tscn")

# Quit_buton
func _on_quit_button_pressed() -> void:
	get_tree().quit()
