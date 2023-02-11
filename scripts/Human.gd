extends KinematicBody2D

export var current_speed = 50
export var arrival_tolerance = 10

export(String) var _surname = "Иванов"
export(String) var _name = "Иван"
export(int) var _age = 54

enum Sex {Woman, Man}
export(Sex) var _sex = Sex.Man

var goals
var goal_pos
var current_goal_index = -1

var animations

func _ready():
	goals = get_parent().get_child(1).get_children()
	#print(goals)
	
	get_node("/root/GodotTown/Clock").connect("time", self, "_on_Clock_time")
	
	var woman_frames = load("res://assets/animations/Woman.tres")

	match _sex:
		Sex.Man:
			pass
		Sex.Woman:
			$Sprite.frames = woman_frames

func _physics_process(delta):
	# # Similar to the car, when the pedestrian gets close enough to the goal, despawn it
	if current_goal_index != -1:
		if global_position.distance_to(goal_pos) <= arrival_tolerance:
			set_animation(Vector2.ZERO)
			return
		# # Find the next point in the path to navigate to and update the internal path within the agent
		var next_location = $NavigationAgent2D.get_next_location()
		#Calculate the direction and movement just as before
		var direction = (next_location - global_position).normalized()
		var movement = direction * current_speed
		$NavigationAgent2D.set_velocity(movement * delta)
	else:
		set_animation(Vector2.ZERO)

func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	safe_velocity = safe_velocity.normalized()
	set_animation(safe_velocity)	
	move_and_collide(safe_velocity)
	
func set_animation(velocity):
	if velocity.x > 0.1:
		$Sprite.animation = "walk_right"
	if velocity.y > 0.1:
		$Sprite.animation = "walk_down"
	if velocity.x < -0.1:
		$Sprite.animation = "walk_left"
	if velocity.y < -0.1:
		$Sprite.animation = "walk_up"
	if velocity == Vector2.ZERO:
		$Sprite.animation = "stay"

func _on_Clock_time(current_time):
	match current_time:
		1, 2:
			current_goal_index += 1
			current_goal_index %= goals.size()
			goal_pos = goals[current_goal_index].global_position
			print(goals[current_goal_index].global_position)
			$NavigationAgent2D.set_target_location(goal_pos)
	
	
	
