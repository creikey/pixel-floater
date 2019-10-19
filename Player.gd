extends KinematicBody2D

export var move_acceleration = 50.0
export var move_decelleration = 80.0

var acceleration: Vector2 = Vector2()
var velocity: Vector2 = Vector2()

func _physics_process(delta):
	var horizontal: int = int(Input.is_action_pressed("g_right")) - int(Input.is_action_pressed("g_left"))
	
	if horizontal == 0:
		acceleration.x = -sign(velocity.x)*move_decelleration
	else:
		acceleration.x = horizontal*move_acceleration
	
	velocity += acceleration*delta
	move_and_collide(velocity*delta)