extends "res://Scripts/map.gd"

func LightOnDots(areaid):
	
	if areaid == 0:
		find_child("0").DotOn()
		find_child("1").DotOn()
		find_child("2").DotOn()
	
	elif areaid == 1:
		find_child("10").DotOn()
		find_child("11").DotOn()
	
	elif areaid == 2:
		find_child("20").DotOn()
		find_child("21").DotOn()
		find_child("22").DotOn()
		find_child("23").DotOn()
		find_child("24").DotOn()
		find_child("25").DotOn()
		find_child("26").DotOn()
		find_child("27").DotOn()
	
	elif areaid == 3:
		find_child("30").DotOn()
		find_child("31").DotOn()
		find_child("32").DotOn()
		find_child("33").DotOn()
		find_child("34").DotOn()
		find_child("35").DotOn()
	
	elif areaid == 4:
		find_child("40").DotOn()
		find_child("41").DotOn()
		find_child("42").DotOn()
		find_child("43").DotOn()
		find_child("44").DotOn()
	
	elif areaid == 5:
		find_child("50").DotOn()
		find_child("51").DotOn()
		find_child("52").DotOn()
		find_child("53").DotOn()
		find_child("54").DotOn()
		find_child("55").DotOn()
		find_child("56").DotOn()
		find_child("57").DotOn()
		find_child("58").DotOn()
	
	else:
		find_child("60").DotOn()
		find_child("61").DotOn()
		find_child("62").DotOn()


func LightOffDots():
	find_child("0").DotOff()
	find_child("1").DotOff()
	find_child("2").DotOff()
	find_child("10").DotOff()
	find_child("11").DotOff()
	find_child("20").DotOff()
	find_child("21").DotOff()
	find_child("22").DotOff()
	find_child("23").DotOff()
	find_child("24").DotOff()
	find_child("25").DotOff()
	find_child("26").DotOff()
	find_child("27").DotOff()
	find_child("30").DotOff()
	find_child("31").DotOff()
	find_child("32").DotOff()
	find_child("33").DotOff()
	find_child("34").DotOff()
	find_child("35").DotOff()
	find_child("40").DotOff()
	find_child("41").DotOff()
	find_child("42").DotOff()
	find_child("43").DotOff()
	find_child("44").DotOff()
	find_child("50").DotOff()
	find_child("51").DotOff()
	find_child("52").DotOff()
	find_child("53").DotOff()
	find_child("54").DotOff()
	find_child("55").DotOff()
	find_child("56").DotOff()
	find_child("57").DotOff()
	find_child("58").DotOff()
	find_child("60").DotOff()
	find_child("61").DotOff()
	find_child("62").DotOff()


func _on_light_up_timer_timeout():
	LightOffDots()

func _on_play_timer_timeout():
	UpdateTimer()
