extends KinematicBody2D

export var move_acceleration = 50.0
export var switching_acceleration = 90.0
export var move_decelleration = 80.0
export var maximum_velocity = 1200.0

var acceleration: Vector2 = Vector2()
var velocity: Vector2 = Vector2()

func _physics_process(delta):
	var horizontal: int = int(Input.is_action_pressed("g_right")) - int(Input.is_action_pressed("g_left"))
	var vertical: int = int(Input.is_action_pressed("g_down")) - int(Input.is_action_pressed("g_up"))
	
	if abs(velocity.x) < move_decelleration*delta:
		velocity.x = 0.0
	if abs(velocity.y) < move_decelleration*delta:
		velocity.y = 0.0
	acceleration.x = calculate_acceleration(horizontal, delta, velocity.x)
	acceleration.y = calculate_acceleration(vertical, delta, velocity.y)
	
	velocity += acceleration*delta
	velocity.x = clamp(velocity.x, -maximum_velocity, maximum_velocity)
	velocity.y = clamp(velocity.y, -maximum_velocity, maximum_velocity)
	velocity = move_and_slide(velocity)
#	if get_nu

func calculate_acceleration(input: int, delta: float, velocity: float) -> float:
	if input == 0:
		return -sign(velocity)*move_decelleration
	else:
		if sign(input) != sign(velocity):
			return float(input)*switching_acceleration
		else:
			return float(input)*move_acceleration