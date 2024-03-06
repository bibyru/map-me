extends Control

@onready var Pic = $Picture

@onready var PicLable = $Name
@onready var AnswerLable = $VBoxContainer/Answer
@onready var Scratch = $Scratch

@onready var AnsColorTimer = $AnsColorTimer
@onready var SoundCorrect = $Sounds/Correct
@onready var SoundWrong = $Sounds/Wrong

var island
var picture
var destlist
var destlistsize

var picname : String
var answerid : int


func _ready():
	if island == 1:
		destlist = preload("res://Prefabs/Destinations/jawa.tscn").instantiate()
	
	add_child(destlist)
	destlist = destlist.picnames
	destlistsize = destlist.size()
	
	SetAnsColor()
	GetQuery()


func GetRandomIndex():
	return randi()%destlistsize

func GetQuery():
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
		get_parent().remove_child(self)
		Manager.World.Prompt = null
		Manager.World.ReqTitleScreen()
		
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
			PicLable.set("theme_override_font_sizes/font_size", 15)
		elif len(picname) > 17:
			PicLable.set("theme_override_font_sizes/font_size", 18)
		else:
			PicLable.set("theme_override_font_sizes/font_size", 20)
		
		SetAnsColor()
		PicLable.text = picname
		answerid = int(idstring)
		
		# Repeat prevention
		destlist[index] = String(path+"@")


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

func WrongAns():
	SetAnsColor(2)
	if AnsColorTimer.is_stopped():
		AnsColorTimer.start()
		SoundWrong.play()

func SetAnsColor(num = 0):
	var thecolor = Color("#000")
	if num == 1:
		thecolor = Color("#00ff00")
	elif num == 2:
		thecolor = Color("#ff0004")
	AnswerLable.set("theme_override_colors/font_color", thecolor)

func _on_ans_color_timer_timeout():
	if AnswerLable.get("theme_override_colors/font_color") == Color("#00ff00"):
		GetQuery()
	else:
		SetAnsColor()


func HideName():
	PicLable.visible = 0
	Scratch.visible = 1
	
func ShowName():
	PicLable.visible = 1
	Scratch.visible = 0

func ResetPaths():
	for i in range(destlistsize):
		destlist[i][ len(destlist[i]) -1 ] = ""
