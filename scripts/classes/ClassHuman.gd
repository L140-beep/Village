class_name Human 
extends TownObject

export var _name : String
export var _surname : String
export var _age : int

enum Sex {Woman, Man}
export(Sex) var _sex = Sex.Man

func _ready():
	._ready()

func initialize(name : String, surname : String, age : int, sex : String):
	_name = name
	_surname = surname
	_age = age
	_sex = sex

func get_class(): 
	return "Human"
