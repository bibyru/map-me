extends Node2D

@onready var lableIsland = $"../Pick/Label"
@onready var Locks = $Locks
@onready var Map = $Sprite2D

var location = -1
var started = false


func _ready():
	Locks.visible = 0
	Map.frame = 2


func Started():
	Locks.visible = 1
	Map.frame = 3
	started = true
	
func _process(delta):
	if started == true:
		
		if location == 1:
			Map.frame = 4
		else:
			Map.frame = 3


func _input(event):
	if started == true && event is InputEventMouseButton && event.pressed:
		
		if location >= 1 && location <= 7:
			
			# CANNOT GO TO OTHER PLACES PLEASE
			if location == 1:
				PickedIsland()


func PickedIsland():
	Manager.World.Pick.visible = 0
	create_tween().tween_property(Map, "modulate", Color(1,1,1,0), 1)
	create_tween().tween_property(Locks, "modulate", Color(1,1,1,0), 1)
	
	var onetimer = Timer.new()
	onetimer.one_shot = true
	onetimer.wait_time = 2
	add_child(onetimer)
	
	if location == 1:
		onetimer.timeout.connect(Manager.World.ReqIsland.bind(location))
	
	onetimer.start()


func _on__sumatra_mouse_entered():
	location = 0
	lableIsland.text = "Sumatra"
func _on__jawa_mouse_entered():
	location = 1
	lableIsland.text = "Jawa"
func _on__kalimantan_mouse_entered():
	location = 2
	lableIsland.text = "Kalimantan"
func _on__sulawesi_mouse_entered():
	location = 3
	lableIsland.text = "Sulawesi"
func _on__maluku_mouse_entered():
	location = 4
	lableIsland.text = "Maluku"
func _on__ntb_mouse_entered():
	location = 5
	lableIsland.text = "Nusa Tenggara Barat"
func _on__ntt_mouse_entered():
	location = 6
	lableIsland.text = "Nusa Tenggara Timur"
func _on__papua_mouse_entered():
	location = 7
	lableIsland.text = "Papua"
