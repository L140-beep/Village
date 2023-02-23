class_name BulletinBoard
extends TownObject

var updated_today = false

var free_workplaces = []
var free_homes = []


func _ready():
	._ready()
	get_node("/root/GodotTown/Clock").connect("time", self, "_on_Clock_time")

func get_class():
	return "BulletinBoard"

func update_info():
	var observer = get_parent()

	if observer.has_method("get_info"):
		var info = observer.get_info()
		
		free_workplaces = info[0]
		free_homes = info[1]
	

func _on_Clock_time(current_time):
	if !updated_today:
		update_info()
		updated_today = true
	elif current_time == 0:
		updated_today = false
