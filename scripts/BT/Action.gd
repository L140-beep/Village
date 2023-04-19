class_name BtAction
extends BtNode

var action : FuncRef

func _init(obj : Object, func_name : String):
    action = funcref(obj, func_name)

func execute():
    return action.call_func()