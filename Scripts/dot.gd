extends Node2D

@export var id : int

func _on_area_2d_mouse_entered():
	$Sprite2D.frame = 1
	get_owner().ReqAns(id)
func _on_area_2d_mouse_exited():
	$Sprite2D.frame = 0
