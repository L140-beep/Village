extends KinematicBody2D

export (int, LAYERS_2D_NAVIGATION) var nav_layer = 1
export (String) var goal
onready var goal_position = get_node(goal).global_position

export (int) var speed = 50
export (int) var arrival_tolerance = 10

var path = null
var path_index = 0

func _ready():
	pass
func move_towards_goal(distance):
	if not path:
		path = Navigation2DServer.map_get_path(get_world_2d().navigation_map, global_position, goal_position, false, nav_layer)
		path_index = 0
		return
		
	if global_position.distance_to(path[path_index]) <= arrival_tolerance:
		path_index += 1
		
	var direction = (path[path_index] - global_position).normalized()
	var movement = direction * distance

	move_and_collide(movement)

func _physics_process(delta):
	if global_position.distance_to(goal_position) <= arrival_tolerance:
		queue_free()
	else:
		move_towards_goal(delta * speed)
