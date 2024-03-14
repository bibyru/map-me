extends Node2D

var MapFullLoad = load("res://Scenes/map_full.tscn")
var TitleLoad = load("res://Scenes/title.tscn")
var SummaryLoad = load("res://Scenes/summary.tscn")

@onready var Parent = $CanvasBg/Control
@onready var Pick = $CanvasBg/Control/Pick

var MapFull
var Title
var Summary

var Map
var Prompt


func _ready():
	ReqTitleScreen()
	Pick.visible = false


func ReqTitleScreen():
	if MapFull == null:
		if Map != null:
			Parent.remove_child(Map)
			Map = null
		if Prompt != null:
			Parent.remove_child(Prompt)
			Prompt = null
		
		MapFull = MapFullLoad.instantiate()
		Title = TitleLoad.instantiate()
		
		Parent.add_child(MapFull)
		Parent.add_child(Title)

func ReqSummary():
	Summary = SummaryLoad.instantiate()
	Parent.add_child(Summary)
	Summary.CorrectCounter.text = "%d / %d" % [Map.correctCounter, Prompt.destlistsize]


func ReqStart():
	MapFull.Started()
	Pick.visible = true


func ReqIsland(num):
	if MapFull != null:
		Parent.remove_child(MapFull)
		MapFull = null
	
	ReqPrompt(num)
	if num == 1:
		ReqJawa()

func ReqJawa():
	Map = load("res://Scenes/map_jawa.tscn").instantiate()
	Parent.add_child(Map)


func ReqPrompt(num):
	Prompt = load("res://Prefabs/prompt.tscn").instantiate()
	Prompt.island = num
	Parent.add_child(Prompt)
