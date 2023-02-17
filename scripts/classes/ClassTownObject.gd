signal registration(node)

class_name TownObject extends Node2D

var _id = -1

func _ready():
    if _id == -1:
        connect("registration", get_parent(), "_on_object_registration")
        emit_signal("registration", self)

func get_class():
    return "TownObject"