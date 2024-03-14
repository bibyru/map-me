extends Node2D

@export var id : int

var mousein = false

func DotOn():
	$Sprite2D.frame = 2

func DotOff():
	if mousein == false:
		$Sprite2D.frame = 0

func _on_area_2d_mouse_entered():
	mousein = true
	$Sprite2D.frame = 1
	get_owner().ReqAnsDisplay(id)
func _on_area_2d_mouse_exited():
	mousein = false
	DotOff()

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		if $Sprite2D.frame == 1:
			get_owner().ReqAnsCheck(id)
