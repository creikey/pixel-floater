extends KinematicBody2D

signal dead

var despawn_distance: float = 500.0
var player_node: Node2D

func _process(delta):
	if player_node.global_position.distance_to(global_position) >= despawn_distance:
		emit_signal("dead")
		queue_free()