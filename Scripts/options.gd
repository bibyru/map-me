extends Node2D

const px720 = Vector2(1280, 720)
const px1080 = Vector2(1920, 1080)


func _ready():
	DisplayServer.window_set_size(px720)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)


func IHide():
	get_child(0).visible = false

func IShow():
	get_child(0).visible = true


func _on_close_pressed():
	Manager.ReqPause()

func _on_quit_pressed():
	get_tree().quit()

func _on_check_button_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

