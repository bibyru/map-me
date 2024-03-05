extends Node2D

@onready var citylist = $Cities

var Prompt

func _ready():
	#           Control      Prompt
	Prompt = get_parent().get_child(2)

func ReqAnsDisplay(id):
	Prompt.AnswerLable.text = citylist.provJawa[id/10][id%10]

func ReqAnsCheck(id):
	Prompt.CheckAns(id)
