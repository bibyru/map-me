extends Node2D

func IHide():
	get_child(0).visible = false

func IShow():
	get_child(0).visible = true


func _on_close_pressed():
	Manager.ReqPause()

func _on_quit_pressed():
	get_tree().quit()

func _on_full_checkbutton_toggled(state):
	if state == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_border_checkbutton_toggled(state):
	if state == true:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	else:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
