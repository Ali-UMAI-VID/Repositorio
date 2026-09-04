extends Control

@export var sonido_boton: AudioStreamPlayer2D
@export_file_path("*.tscn") var escena_menu_path : String
@export_file_path("*.tscn") var escena_nivel_path : String
@export var PosJugador : TextureRect

@export var BotonRenaudar : AnimatedSprite2D
@export var BotonMenu : AnimatedSprite2D
@export var BotonOpciones : AnimatedSprite2D
@export var BotonSalir : AnimatedSprite2D


func _process(delta):
	if PosJugador.position.y == 492:
		BotonRenaudar.frame = 1
		BotonMenu.frame = 0
		BotonOpciones.frame = 0
		BotonSalir.frame = 0
		if 	Input.is_action_pressed("Espacio"):
			Globales.vidas = 3
			Globales.score = 60
			sonido_boton.play()
			get_tree().change_scene_to_file(escena_nivel_path)
	if PosJugador.position.y == 619.5:
		BotonRenaudar.frame = 0
		BotonMenu.frame = 1
		BotonOpciones.frame = 0
		BotonSalir.frame = 0
		if 	Input.is_action_pressed("Espacio"):
			Globales.vidas = 3
			Globales.score = 60
			#Globales.nivel = 0
			sonido_boton.play()
			await get_tree().change_scene_to_file(escena_menu_path)
	if PosJugador.position.y == 747:
		BotonRenaudar.frame = 0
		BotonMenu.frame = 0
		BotonOpciones.frame = 1
		BotonSalir.frame = 0
	if PosJugador.position.y == 874.5:
		BotonRenaudar.frame = 0
		BotonMenu.frame = 0
		BotonOpciones.frame = 0
		BotonSalir.frame = 1
		if 	Input.is_action_pressed("Espacio"):
			sonido_boton.play()
			get_tree().quit()

func _physics_process(delta):
	if Input.is_action_just_pressed("Mov_abajo"):
		PosJugador.position.y += 127.5
		print (PosJugador.position.y)
	if Input.is_action_just_pressed("Mov_arriba"):
		PosJugador.position.y -= 127.5
		print(PosJugador.position)
	#PosJugador.position.x = clamp(PosJugador.position.x,317,555)
	PosJugador.position.y = clamp(PosJugador.position.y,492,874.5)
