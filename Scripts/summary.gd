extends Control

@onready var CorrectCounter = $Panel/VBoxContainer/Correct/CorrectCounter

func _on_title_pressed():
	Manager.World.Summary = null
	get_parent().remove_child(self)
	Manager.World.ReqTitleScreen()

func _on_quit_pressed():
	Manager.ReqQuit()
