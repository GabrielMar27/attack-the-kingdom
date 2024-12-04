extends Node2D

@onready var background: Node2D = $Background  # Nodul părinte care conține TileMapLayer pentru fundal
@onready var ground: Node2D = $Ground  # Nodul părinte care conține TileMapLayer pentru pământ
@export var tile_size : Vector2 = Vector2(64, 64)  # Dimensiunea fiecărui tile

func _ready():
	# Ajustează scara fundalului și pământului în funcție de dimensiunea ferestrei
	adjust_scale_for_layers()

func _process(delta):
	# Dacă dimensiunea ferestrei se schimbă, actualizează scara
	if get_viewport().size.x != background.scale.x or get_viewport().size.y != background.scale.y:
		adjust_scale_for_layers()

func adjust_scale_for_layers():
	# Obține dimensiunile ferestrei
	var screen_width = get_viewport().size.x
	var screen_height = get_viewport().size.y

	# Calculează câte tile-uri sunt necesare pe fiecare axă
	var tiles_x = int(ceil(screen_width / tile_size.x))  # Câte tile-uri pe axa X
	var tiles_y = int(ceil(screen_height / tile_size.y))  # Câte tile-uri pe axa Y

	# Ajustează scara fundalului pentru a se potrivi cu dimensiunea ferestrei
	background.scale = Vector2(screen_width / (tiles_x * tile_size.x), 
							   screen_height / (tiles_y * tile_size.y))

	## Ajustează scara pământului (dacă este necesar)
	#ground.scale = Vector2(screen_width / (tiles_x * tile_size.x), 
						   #screen_height / (tile_size.y))  # Pământul este doar pe un rând pe axa Y
#
	## Poziționează pământul la baza ecranului
	#ground.position = Vector2(0, screen_height - tile_size.y)
