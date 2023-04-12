class_name Workplace extends TownObject

export(int) var owner_id = -1
var resource : TownResource
export(int)var performance : int
# var requirements : Array
var active = false
export(int)var start_time = 9
export(int)var restTime = 13
export(int)var end_time = 18


func get_class():
	return "Workplace"
