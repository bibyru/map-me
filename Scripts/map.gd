extends Node2D

@onready var citylist = $Cities

@onready var Dots = $Dots
@onready var LightOnTimer = $LightOnTimer
@onready var Stats = $Stats

var Prompt

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


# UI
func Cheat():
	Stats.CheatLabel.text = citylist.All[Prompt.answerid/10][Prompt.answerid%10]
func _input(event):
	if event.is_action("Cheat"):
		Cheat()
	elif event.is_action_pressed("Cheat2"):
		if Stats.CheatLabel.visible == true:
			Stats.CheatLabel.visible = 0
		else:
			Stats.CheatLabel.visible = 1


# CHILD SCRIPTS
func LightOnDots(areaid):
	pass
func LightOffDots():
	pass

