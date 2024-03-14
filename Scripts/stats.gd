extends Control

@onready var TimerLabel = $VBoxContainer/Timer
@onready var CorrectLabel = $VBoxContainer/Correct
@onready var CheatLabel = $VBoxContainer/Cheat
@onready var ScoreLabel = $VBoxContainer/Score

var score = 0

func UpdateScore(num):
	score += num
	ScoreLabel.text = "Score: %d" % [score]
