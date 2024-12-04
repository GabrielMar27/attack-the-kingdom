extends Node2D

@export var scroll_speed = 100.0 # Viteza de mișcare a norilor (pixeli/secundă)
@export var texture_width = 1024 # Lățimea texturii folosite pentru tile-uri

func _process(delta):
	# Mișcă TileMapLayer pe axa X
	position.x -= scroll_speed * delta
	print(position.x)
	# Resetează poziția pentru a crea efect infinit
	print(position.x <= -texture_width)
	if position.x <= -texture_width:
		position.x += texture_width
