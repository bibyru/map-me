extends Control

var state = false
var canclick = false

signal toggled(state: bool)

func _input(event):
	if canclick == true && event is InputEventMouseButton && event.pressed:
		
		if state == true:
			state = false
			$on.visible = 0
			$off.visible = 1
			
		else:
			state = true
			$on.visible = 1
			$off.visible = 0
		
		toggled.emit(state)


func _on_area_2d_mouse_entered():
	canclick = true
func _on_area_2d_mouse_exited():
	canclick = false
