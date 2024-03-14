extends Node2D

@onready var citylist = $Cities

@onready var Dots = $Dots
@onready var LightOnTimer = $LightOnTimer
@onready var Correct = $Correct

var Prompt
var correctCounter = 0

func _ready():
	$Cheat.visible = 0
	#           Control      Prompt
	Prompt = get_parent().get_child(2)

func ReqAnsDisplay(id):
	Prompt.AnswerLabel.text = citylist.All[id/10][id%10]

func ReqAnsCheck(id):
	Prompt.CheckAns(id)

func ReqHint(id):
	Prompt.HintLabel.text = citylist.AllName[id/10]
	
	if LightOnTimer.is_stopped():
		LightOnTimer.start()
		LightOnDots(id/10)

func CountCorrect():
	correctCounter += 1
	Correct.text = "Correct: %d" % [correctCounter]


# child scripts
func LightOnDots(areaid):
	pass
func LightOffDots():
	pass


# cheating
var allowcheat = true
func Cheat():
	if allowcheat == true:
		$Cheat.text = citylist.All[Prompt.answerid/10][Prompt.answerid%10]
func _input(event):
	if event.is_action("Cheat"):
		Cheat()
	elif event.is_action_pressed("Cheat2"):
		if $Cheat.visible == 1:
			$Cheat.visible = 0
		else:
			$Cheat.visible = 1
