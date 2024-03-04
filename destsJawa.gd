extends Node2D

var picnames = []

func _ready():
	var path = "res://Sauce/Photos/1"
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	
	var filename = dir.get_next()
	while (filename != ""):
		filename = filename.replace(".import", "")
		if filename.ends_with(".jpg"):
			picnames.append(String(path+"/"+filename))
		filename = dir.get_next()
	dir.list_dir_end()
