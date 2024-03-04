extends Node2D

@export var id : int

func _on_area_2d_mouse_entered():
	$Sprite2D.frame = 1
	get_owner().ReqAnsDisplay(id)
func _on_area_2d_mouse_exited():
	$Sprite2D.frame = 0

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		if $Sprite2D.frame == 1:
			get_owner().ReqAnsCheck(id)
