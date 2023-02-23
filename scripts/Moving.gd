extends KinematicBody2D

export var current_speed = 50
export var arrival_tolerance = 10

var goal_pos = -1

func _ready():
	pass

func _physics_process(delta):
	if goal_pos != -1:
		if global_position.distance_to(goal_pos) <= arrival_tolerance:
					set_animation(Vector2.ZERO)
					return

		var next_location = $NavigationAgent2D.get_next_location()
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

func set_goal(goal):
	goal_pos = goal.global_position
	print("here")
