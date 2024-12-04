extends Node2D

@export var cloud_sprites : Array[Texture] = [] # Texturi pentru nori (setate în editor)
@export var scroll_speed = 100.0 # Viteza mișcării norilor (pixeli/secundă)
@export var cloud_spawn_interval = 0.5 # Interval în secunde pentru a genera nori

var cloud_timer = 0.0 # Timpul scurs pentru generarea norilor

func _process(delta):
	# Mișcă norii existenți
	for cloud in get_children():

		cloud.position.x -= scroll_speed * delta
		
		# Verifică dacă norul a ieșit din partea dreaptă a ecranului
		if cloud.position.x > get_viewport().size.x:
			cloud.queue_free()  # Șterge norul când iese din ecran

	# Generează nori la intervale regulate
	cloud_timer += delta
	if cloud_timer >= cloud_spawn_interval:
		spawn_cloud()
		cloud_timer = 0.0

func spawn_cloud():
	if cloud_sprites.size() == 0:
		return # Nu avem texturi pentru nori, ieșim
	
	# Creează un nou nod Sprite pentru un nor
	var cloud = Sprite2D.new()  # Crează un nod Sprite
	
	# Alege aleatoriu o textură din lista de texturi
	cloud.texture = cloud_sprites[randi() % cloud_sprites.size()]
	
	# Obține dimensiunile ferestrei
	var screen_width = get_viewport().size.x
	var screen_height = get_viewport().size.y
	# Poziționează norul aleatoriu pe axa Y, deasupra ecranului
	var y_position = -randf_range(0,screen_height/2)  # Poziție Y aleatorie (până la jumătatea ferestrei)
	
	# Poziționează norul la marginea stângă (pentru a veni din exterior)
	cloud.position = Vector2(screen_width-100, y_position)
	
	# Adaugă norul în scenă ca un copil al nodului curent
	add_child(cloud)
