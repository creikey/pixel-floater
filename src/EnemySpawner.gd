tool
extends Node2D
 
export var safe_radius = 500.0
export var camera_view_radius = 400.0
export var player_visibility_radius = 1000.0
export (NodePath) var player_path

var player_node: Node2D = null

func _process(delta):
	if Engine.editor_hint:
		if player_path != "":
			player_node = get_node(player_path)
		update()
		
		return

func _draw():
	if not Engine.editor_hint:
		return
	draw_circle(Vector2(), safe_radius, Color(0, 1, 0, 0.8))
	if player_node != null:
		draw_circle(player_node.global_position, camera_view_radius, Color(1, 0, 0, 0.4))
		draw_circle(player_node.global_position, player_visibility_radius, Color(1, 0, 0, 0.1))