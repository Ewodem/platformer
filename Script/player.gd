extends CharacterBody3D


const SPEED := 5.0
const PUSH_FORCE := 15
var jump_velocity := 4.5
var pause_menu = preload("res://Scene/pause_menu.tscn")



func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle the jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	#Open menu
	if Input.is_action_just_pressed("menu") and Globals.menu_exist == false:
		var instance = pause_menu.instantiate()
		add_child(instance)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Globals.menu_exist = true
	
	#Rotate the robot.
	if Input.is_action_pressed("turn_left"):
		rotate_y(PI/40)
	elif Input.is_action_pressed("turn_right"):
		rotate_y(-PI/40)

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("null", "null", "walk_forwards", "walk_backwards")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if direction.x != 0 and direction.z != 0:
		$Robot_full/Wheel.rotation.y += 0.2
	
	move_and_slide()
	
	#Match camera position with character
	$Camera_control.position = lerp($Camera_control.position, position, 0.5)
	$Camera_control.rotation.y = lerp_angle($Camera_control.rotation.y, rotation.y, 0.1)

# Death zone
func _on_death_zone_body_shape_entered(_body_rid: RID, _body: Node3D, _body_shape_index: int, _local_shape_index: int) -> void:
	position = Vector3(0,2,0)
	$"../DeathSFX".play()
	
