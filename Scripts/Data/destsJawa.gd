extends Node2D

var picnames = []

func _ready():
	var path = "res://Sauce/Photos/1"
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	
	while true:
		var filename = dir.get_next()
		if filename == "":
			break
		else:
			if filename.ends_with(".jpg"):
				picnames.append(String(path+"/"+filename))
	dir.list_dir_end()
