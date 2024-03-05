extends Node2D

@onready var TabSettings = $CanvasLayer/Control/MarginContainer/Panel/Settings
@onready var TabGame = $CanvasLayer/Control/MarginContainer/Panel/Game

var prompthide = false

func IHide():
	get_child(0).visible = false

func IShow():
	get_child(0).visible = true


func _ready():
	ShowSettings()


func ShowSettings():
	TabSettings.visible = 1
	TabGame.visible = 0
func ShowGame():
	TabSettings.visible = 0
	TabGame.visible = 1

func _on_tab_bar_tab_changed(tab):
	if tab == 0:
		ShowSettings()
	else:
		ShowGame()


# SETTINGS
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


# GAME
func _on_hide_name_checkbutton_toggled(state):
	if state == true:
		prompthide = true
	else:
		prompthide = false


# Buttons
func _on_close_pressed():
	Manager.ReqPause()

func _on_title_pressed():
	Manager.World.ReqTitleScreen()
	Manager.ReqPause()

func _on_quit_pressed():
	get_tree().quit()
