extends Node2D

@onready var TabSettings = $CanvasLayer/Control/MarginContainer/Panel/Settings
@onready var TabGame = $CanvasLayer/Control/MarginContainer/Panel/Game

@onready var SliderMaster = $CanvasLayer/Control/MarginContainer/Panel/Settings/Master/MasterHSlider
@onready var SliderSound = $CanvasLayer/Control/MarginContainer/Panel/Settings/Sound/SoundHSlider
@onready var SliderMusic = $CanvasLayer/Control/MarginContainer/Panel/Settings/Music/MusicHSlider

@onready var BusMaster = AudioServer.get_bus_index("Master")
@onready var BusSound = AudioServer.get_bus_index("Sound")
@onready var BusMusic = AudioServer.get_bus_index("Music")

var prompthide = false

func IHide():
	get_child(0).visible = false

func IShow():
	get_child(0).visible = true


func _ready():
	ShowSettings()
	SliderMaster.value = 100
	SliderSound.value = 100
	SliderMusic.value = 50


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


func _on_master_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(BusMaster, linear_to_db( float(value)/100 ))

func _on_sound_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(BusSound, linear_to_db( float(value)/100 ))

func _on_music_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(BusMusic, linear_to_db( float(value)/150 ))


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
