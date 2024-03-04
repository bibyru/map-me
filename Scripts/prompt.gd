extends Control

@onready var Pic = $Picture
@onready var PicLable = $Name
@onready var AnswerLable = $VBoxContainer/Answer

var island
var picture
var destlist

var picname : String
var answerid : int

func _ready():
	if island == 1:
		destlist = preload("res://Prefabs/Prompt/jawa.tscn").instantiate()
		add_child(destlist)
		destlist = destlist.picnames
	
	GetQuery()


func GetQuery():
	picname = ""
	
	var path = destlist[randi()%destlist.size()]
	picture = load(path)
	
	Pic.texture = picture
	
	# res://Sauce/Photos/1/10# is 24 chars
	var idstring : String
	for i in range(len(path)):
		if i == 21 or i == 22:
			idstring += path[i]
		
		if i >= 24:
			if path[i] == ".":
				break
			picname += path[i]
	
	PicLable.text = picname
	answerid = int(idstring)
