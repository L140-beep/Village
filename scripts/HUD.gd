extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func show_message(message):
	$CurrentTimeMessage.text = message


func _on_Clock_time(current_time):
	var str_time = str(current_time) + ":00"
	if str_time.length() == 4:
		str_time = "0" + str_time
	show_message("Time: %s" % str_time)
	
