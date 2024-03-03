extends Node2D

@onready var citylist = $Cities

var PromptAns

func _ready():
	PromptAns = get_owner().find_child("Prompt").find_child("Answer")

func ReqAns(id):
	PromptAns.text = citylist.provJawa[id/10][id%10]
