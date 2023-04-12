extends Node2D

#TODO: Реализовать в качестве единого map
var people = []
var workplaces = []
var homes = []
var boards = []

var id = 0


func _ready():
	$Music.play()

func get_free_objects(objects):
	var result = []

	for object in objects:
		if object.owner_id == -1:
			result.append(object)
	
	return result

func get_boards():
	return boards

func get_info():
	var free_workplaces = get_free_objects(workplaces)
	var free_homes = get_free_objects(homes)

	return [free_workplaces, free_homes]


func _on_Clock_time(_current_time):
	pass

func _registration(node, arr):
	node._id = id
	arr.append(node)
	id += 1
	print(arr)

func _on_object_registration(node):
	match node.get_class():
		"Human":
			_registration(node, people)
		"Workplace":
			_registration(node, workplaces)
		"Home":
			_registration(node, homes)
		"BulletinBoard":
			_registration(node, boards)
			
