extends Node2D

var LoadedOpt = preload("res://Scenes/options.tscn")
var MenuOpt

func _ready():
	MenuOpt = LoadedOpt.instantiate()
	add_child(MenuOpt)
	
	MenuOpt.IHide()

func _unhandled_key_input(event):
	if event.is_action_pressed("Esc"):
		ReqPause()

func ReqPause():
	if get_tree().paused == false:
		MenuOpt.IShow()
		get_tree().paused = true
	else:
		MenuOpt.IHide()
		get_tree().paused = false
