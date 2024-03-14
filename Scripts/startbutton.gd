extends Node2D

var parent

func _ready():
	parent = get_parent()

func _on_button_pressed():
	if $Timer.is_stopped():
		$Timer.start()
		
		create_tween().tween_property(get_parent(), "position:y", -150, 1)

func _on_timer_timeout():
	Manager.World.ReqStart()
	Manager.World.Parent.remove_child(get_owner())

func _on_options_pressed():
	Manager.ReqPause()
