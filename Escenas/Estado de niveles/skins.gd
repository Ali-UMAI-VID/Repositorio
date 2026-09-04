extends Control

#@export var escena_nivel: PackedScene
@export var PosJugador : Sprite2D

@export var sonido_boton : AudioStreamPlayer2D
@export var skin_default : AnimatedSprite2D
@export var boton_volver : AnimatedSprite2D
#@export var escena_menu : PackedScene



func _physics_process(delta):
	
	if Input.is_action_just_pressed("Mov_derecha"):
		print(PosJugador.position.x)
		if PosJugador.position.x == 972 and PosJugador.position.y == 1000:
			return
		PosJugador.position.x += 372
	if Input.is_action_just_pressed("Mov_izquierda"):
		if PosJugador.position.x == 972 and PosJugador.position.y == 1000:
			return
		PosJugador.position.x -= 372
	if Input.is_action_just_pressed("Mov_abajo"):
		print(PosJugador.position.y)
		print(PosJugador.position.x)
		if PosJugador.position.y == 795:
			PosJugador.position.y = 1000
			PosJugador.position.x = 972
		PosJugador.position.y += 369
		
	if Input.is_action_just_pressed("Mov_arriba"):
		print(PosJugador.position.y)
		print(PosJugador.position.x)
		if PosJugador.position.y == 1000:
			PosJugador.position.y = 795
			PosJugador.position.x = 972
			PosJugador.position.y += 369
		PosJugador.position.y -= 369
	
	if PosJugador.position.x == 600 and PosJugador.position.y == 426:
		skin_default.frame =1
	else:	skin_default.frame = 0
	
	if PosJugador.position.y == 1000:
		boton_volver.frame =1
		if Input.is_action_pressed("Espacio"):
			sonido_boton.play()
			#get_tree().change_scene_to_packed(escena_menu)
	else:	boton_volver.frame = 0

	PosJugador.position.x = clamp(PosJugador.position.x,600,1345)#426c795
	PosJugador.position.y = clamp(PosJugador.position.y,426,1000)
