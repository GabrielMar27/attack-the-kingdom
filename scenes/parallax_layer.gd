extends Node2D

@export var scroll_speed = 100.0 # Viteza cu care se deplasează norii (pixeli/secundă)
@export var texture_width = 1024 # Lățimea texturii norilor
@onready var parallax_background: ParallaxBackground = $".."

func _process(delta):
	var layer = parallax_background.get_child(0) # Obține ParallaxLayer
	layer.motion_offset.x -= scroll_speed * delta # Actualizează offset-ul în funcție de timp
	
	# Resetează offset-ul pentru a crea efectul infinit
	if layer.motion_offset.x > texture_width:
		layer.motion_offset.x -= texture_width
