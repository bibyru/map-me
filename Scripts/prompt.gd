extends Control

@onready var Query = $Query
@onready var Pic = $Picture

@onready var PicLabel = $Name
@onready var AnswerLabel = $VBoxContainer/Answer
@onready var Scratch = $Scratch

@onready var AnsColorTimer = $AnsColorTimer
@onready var SoundCorrect = $Sounds/Correct
@onready var SoundWrong = $Sounds/Wrong

@onready var Hint = $Hint
@onready var HintLabel = $Hint/Hint

var island
var picture
var destlist
var destlistsize

var picname : String
var answerid : int
var colorBlack = Color("#000", 0)
var colorGreen = Color("#b6ff24")
var colorRed = Color("#ff0004")

var queries = 0
var wrongs = 0


func _ready():
	if island == 1:
		destlist = preload("res://Prefabs/Destinations/jawa.tscn").instantiate()
	
	add_child(destlist)
	destlist = destlist.picnames
	destlistsize = destlist.size()
	
	SetAnsColor()
	GetQuery()


func QueryCount():
	queries += 1
	Query.text = "Query %d of %d" % [queries, destlistsize]

func GetRandomIndex():
	return randi()%destlistsize

func GetQuery():
	QueryCount()
	wrongs = 0
	Hint.visible = 0
	
	# Check if hide name
	if Manager.MenuOpt.prompthide == true:
		HideName()
	else:
		ShowName()
	
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
		Ending()
		queries = destlistsize-1
		QueryCount()
		
	else:
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
		
		if len(picname) > 25:
			PicLabel.set("theme_override_font_sizes/font_size", 15)
		elif len(picname) > 17:
			PicLabel.set("theme_override_font_sizes/font_size", 18)
		else:
			PicLabel.set("theme_override_font_sizes/font_size", 20)
		
		SetAnsColor()
		PicLabel.text = picname
		answerid = int(idstring)
		
		# Repeat prevention
		destlist[index] = String(path+"@")

func Ending():
	Manager.World.Summary
	Manager.World.ReqSummary()


func CheckAns(id):
	if AnsColorTimer.is_stopped():
		if answerid == id:
			CorrectAns()
		else:
			WrongAns()

func CorrectAns():
	SetAnsColor(1)
	if AnsColorTimer.is_stopped():
		AnsColorTimer.start()
		SoundCorrect.play()
	
	if wrongs == 0:
		Manager.World.Map.CountCorrect()
	wrongs = 0

func WrongAns():
	SetAnsColor(2)
	if AnsColorTimer.is_stopped():
		AnsColorTimer.start()
		SoundWrong.play()
	
	wrongs += 1
	if wrongs >= 3:
		Hint.visible = 1
		Manager.World.Map.ReqHint(answerid)

func SetAnsColor(num = 0):
	var thecolor = colorBlack
	if num == 1:
		thecolor = colorGreen
	elif num == 2:
		thecolor = colorRed
	AnswerLabel.set("theme_override_colors/font_outline_color", thecolor)

func _on_ans_color_timer_timeout():
	if AnswerLabel.get("theme_override_colors/font_outline_color") == colorGreen:
		GetQuery()
	else:
		SetAnsColor()


func HideName():
	PicLabel.visible = 0
	Scratch.visible = 1
	
func ShowName():
	PicLabel.visible = 1
	Scratch.visible = 0

func ResetPaths():
	for i in range(destlistsize):
		destlist[i][ len(destlist[i]) -1 ] = ""
