extends CanvasLayer
#Close menu
func _on_continue_button_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Globals.menu_exist = false
	queue_free()

#Ensures nu multiplate menus
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		Globals.menu_exist = false
		queue_free()
	
#Return to start screen
func _on_main_menu_button_pressed() -> void:
	Globals.menu_exist = false
	get_tree().change_scene_to_file("res://Scene/start_screen.tscn")

#Quit game
func _on_quit_button_pressed() -> void:
	get_tree().quit()
