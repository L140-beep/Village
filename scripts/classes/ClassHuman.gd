class_name Human 
extends TownObject

export var _name : String
export var _surname : String
export var _age : int

enum Sex {Woman, Man}
var _sex

var home : Home = null 
var goals = {}

func _ready():
	._ready()
	get_node("/root/GodotTown/Clock").connect("time", self, "_on_Clock_time")

func initialize(name : String, surname : String, age : int, sex : String):
	_name = name
	_surname = surname
	_age = age
	_sex = sex
	
func get_class(): 
	return "Human"

func find_object(object):
	pass

func create_schedule():
	pass

func go_to_sleep():
	pass

func add_own_thing():
	pass

func do_own_things():
	return true
	
func _on_Clock_time(current_time):
	pass

func set_goal(goal):
	$Body.set_goal(goal)
