extends Node2D

const px720 = Vector2(1280, 720)
const px1080 = Vector2(1920, 1080)

var Options
var World

func _ready():
	World = get_parent().get_child(1)
	
	Options = preload("res://Scenes/options.tscn").instantiate()
	add_child(Options)
	Options.IHide()
	
	DisplayServer.window_set_size(px720)

func _unhandled_key_input(event):
	if event.is_action_pressed("Esc"):
		ReqPause()

func ReqPause():
	if get_tree().paused == false:
		Options.IShow()
		get_tree().paused = true
	else:
		Options.IHide()
		get_tree().paused = false

func ReqQuit():
	get_tree().paused = true
	get_tree().quit()
