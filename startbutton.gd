extends Node2D

var parent
var removeme = false

func _ready():
	parent = get_parent()

func _process(delta):
	if removeme == true:
		parent.position.y -= .5

func _on_button_pressed():
	if $Timer.is_stopped():
		$Timer.start()
		removeme = true

func _on_timer_timeout():
	# Control Title    World
	parent.get_owner().get_owner().ReqStart()
