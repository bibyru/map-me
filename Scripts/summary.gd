extends Control

@onready var CorrectLabel = $Panel/VBoxContainer/Correct/CorrectLabel
@onready var ScoreLabel = $Panel/VBoxContainer/Score/ScoreLabel
@onready var TimeLabel = $Panel/VBoxContainer/Time/TimeLabel

func _on_title_pressed():
	Manager.World.Summary = null
	get_parent().remove_child(self)
	Manager.World.ReqTitleScreen()

func _on_quit_pressed():
	Manager.ReqQuit()
