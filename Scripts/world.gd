extends Node2D

@onready var Parent = $CanvasBg/Control
@onready var Pick = $CanvasBg/Control/Pick

func _ready():
	Pick.visible = false

func ReqStart():
	find_child("MapFull").Started()
	Parent.remove_child(find_child("Title"))
	Pick.visible = true

func ReqIsland(num):
	var del = find_child("MapFull")
	Parent.remove_child(del)
	
	if num == 1:
		ReqJawa()

func ReqJawa():
	ReqPrompt(1)
	Parent.add_child(load("res://Scenes/map_jawa.tscn").instantiate())

func ReqPrompt(num):
	var prompt = preload("res://Prefabs/prompt.tscn").instantiate()
	prompt.island = num
	Parent.add_child(prompt)
