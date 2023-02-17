extends Node2D


var people = {}
var workplaces = {}

var human_id = 0
var workplace_id = 0

var objects

func _ready():
	$Music.play()



#func _process(delta):
#	pass


func _on_Clock_time(_current_time):
	pass

func _registration(node, key, dict):
	node._id = key
	dict[key] = node

func _on_object_registration(node):
	match node.get_class():
		"Human":
			_registration(node, human_id, people)
			human_id += 1
			print(people)
		"Workplace":
			_registration(node, workplace_id, workplaces)
			workplace_id += 1
			print(workplaces)
