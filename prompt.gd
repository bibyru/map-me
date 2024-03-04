extends Control

@onready var Pic = $Picture
@onready var PicLable = $Name
@onready var AnswerLable = $VBoxContainer/Answer

var island
var picture
var destlist
var destlistsize

var picname : String
var answerid : int

func _ready():
	if island == 1:
		destlist = preload("res://Prefabs/Prompt/jawa.tscn").instantiate()
	
	add_child(destlist)
	destlist = destlist.picnames
	destlistsize = destlist.size()
	
	GetQuery()


func GetRandomIndex():
	return randi()%destlistsize
	
func GetQuery():
	picname = ""
	
	var index = GetRandomIndex()
	var path = destlist[index]
	
	# Repeat check
	var repeating = 0
	while (path[len(path)-1] == "@" && repeating != 2):
		index += 1
		if index >= destlistsize:
			index = 0
			repeating += 1
		path = destlist[index]
	
	if repeating >= 2:
		Manager.ReqQuit()
	
	picture = ResourceLoader.load(path)
	
	Pic.texture = picture
	
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
	
	# Repeat prevention
	destlist[index] = String(path+"@")

func ResetPaths():
	for i in range(destlistsize):
		destlist[i][ len(destlist[i]) -1 ] = ""
