extends ParallaxBackground

@export var scroll_speed = 100.0 # Viteza de mișcare a norilor (pixeli/secundă)

func _process(delta):
	# Actualizăm offset-ul ParallaxBackground pentru mișcare
	scroll_offset.x += scroll_speed * delta
