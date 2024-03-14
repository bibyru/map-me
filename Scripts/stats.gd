extends Control

@onready var TimerLabel = $VBoxContainer/Timer
@onready var CorrectLabel = $VBoxContainer/Correct
@onready var CheatLabel = $VBoxContainer/Cheat
@onready var ScoreLabel = $VBoxContainer/Score
@onready var PlayTimer = $PlayTimer

var correct = 0
var score = 0
var time = 0
var timetext : String


# REQS
func ReqAddScore(num = 0):
	var add : int
	
	if time < 30:
		add = 100
	elif time < 60:
		add = 90
	elif time < 90:
		add = 70
	elif time < 180:
		add = 50
	else:
		add = 30
	
	if num != 0:
		add -= 20
	
	UpdateScore(add)

func ReqStopTimer():
	PlayTimer.stop()


# UPDATES
func UpdateScore(num):
	score += num
	ScoreLabel.text = "Score: %d" % [score]

func UpdateTime():
	time += 1
	
	var min : int = time/60
	var sec : int = time%60
	
	if time < 60:
		min = 0
	
	timetext = "%02d:%02d" %[min, sec]
	TimerLabel.text = timetext

func UpdateCorrect():
	correct += 1
	CorrectLabel.text = "Correct: %d" % [correct]


# MISC
func _on_play_timer_timeout():
	UpdateTime()
