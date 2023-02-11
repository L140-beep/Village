extends Node2D

signal time(current_time)

var current_time
var time_is_changed
# Called when the node enters the scene tree for the first time.
func _ready():
	current_time = 0 
	time_is_changed = true


func _process(_delta):
	if time_is_changed:
		emit_signal("time", current_time)
		time_is_changed = false


func _on_DayTimeTimer_timeout():
	current_time += 1
	current_time %= 24
	time_is_changed = true
	
