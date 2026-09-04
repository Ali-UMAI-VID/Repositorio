extends Control

@export_file var escena_skin: String
@export var sonido_boton: AudioStreamPlayer2D
@export var escena_skins : PackedScene
@export var escena_nivel : PackedScene
@export var PosJugador : TextureRect

@export var BotonJugar : AnimatedSprite2D
@export var BotonTienda : AnimatedSprite2D
@export var BotonOpciones : AnimatedSprite2D
@export var BotonSalir : AnimatedSprite2D

func _process(delta):
	if PosJugador.position.y == 526:
		BotonJugar.frame = 1
		BotonTienda.frame = 0
		BotonOpciones.frame = 0
		BotonSalir.frame = 0
		if 	Input.is_action_pressed("Espacio"):
			sonido_boton.play()
			get_tree().change_scene_to_packed(escena_nivel)
	if PosJugador.position.y == 664.5:
		BotonJugar.frame = 0
		BotonTienda.frame = 1
		BotonOpciones.frame = 0
		BotonSalir.frame = 0
		if 	Input.is_action_pressed("Espacio"):
			sonido_boton.play()
			await get_tree().change_scene_to_file(escena_skin)
	if PosJugador.position.y == 803:
		BotonJugar.frame = 0
		BotonTienda.frame = 0
		BotonOpciones.frame = 1
		BotonSalir.frame = 0
	if PosJugador.position.y == 941.5:
		BotonJugar.frame = 0
		BotonTienda.frame = 0
		BotonOpciones.frame = 0
		BotonSalir.frame = 1
		if 	Input.is_action_pressed("Espacio"):
			sonido_boton.play()
			get_tree().quit()

func _physics_process(delta):
	if Input.is_action_just_pressed("Mov_abajo"):
		PosJugador.position.y += 138.5
		print (PosJugador.position.y)
	if Input.is_action_just_pressed("Mov_arriba"):
		PosJugador.position.y -= 138.5
		print(PosJugador.position)
	#PosJugador.position.x = clamp(PosJugador.position.x,317,555)
	PosJugador.position.y = clamp(PosJugador.position.y,526,941.5)
