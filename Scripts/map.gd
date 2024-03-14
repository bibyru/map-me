extends Node2D

@onready var citylist = $Cities

@onready var Dots = $Dots
@onready var LightOnTimer = $LightOnTimer
@onready var Stats = $Stats
@onready var PlayTimer = $PlayTimer

var Prompt
var correctCounter = 0
var time : int

func _ready():
	Stats.CheatLabel.visible = 0
	
	Prompt = get_parent().get_child(2)


# REQS
func ReqAnsDisplay(id):
	Prompt.AnswerLabel.text = citylist.All[id/10][id%10]

func ReqAnsCheck(id):
	Prompt.CheckAns(id)

func ReqHint(id):
	Prompt.HintLabel.text = citylist.AllName[id/10]
	
	if LightOnTimer.is_stopped():
		LightOnTimer.start()
		LightOnDots(id/10)

func ReqStopTimer():
	PlayTimer.stop()

func ReqAddScore():
	var add : int
	
	if time < 30:
		add = 100
	elif time < 60:
		add = 90
	elif time < 90:
		add = 70
	elif time < 120:
		add = 50
	else:
		add = 30
	
	Stats.UpdateScore(add)


# UI
func CountCorrect():
	correctCounter += 1
	Stats.CorrectLabel.text = "Correct: %d" % [correctCounter]

func UpdateTimer():
	time += 1
	
	var min : int = time/60
	var sec : int = time%60
	
	if time < 60:
		min = 0
	
	Stats.TimerLabel.text = "%02d:%02d" %[min, sec]

func Cheat():
	Stats.CheatLabel.text = citylist.All[Prompt.answerid/10][Prompt.answerid%10]
func _input(event):
	if event.is_action("Cheat"):
		Cheat()
	elif event.is_action_pressed("Cheat2"):
		if Stats.CheatLabel.visible == 1:
			Stats.CheatLabel.visible = 0
		else:
			Stats.CheatLabel.visible = 1


# CHILD SCRIPTS
func LightOnDots(areaid):
	pass
func LightOffDots():
	pass

