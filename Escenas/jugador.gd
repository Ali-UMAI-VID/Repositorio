extends CharacterBody2D

class_name Jugador

@export var velocidad : float = 400
@export var gravedad : float = 15
#@export var animacion_lengua : AnimationPlayer
@export var area_boca : Area2D
@export var timer_inv : Timer

var vida : float = 3

func _ready():
	Globales.jugador = self

func _physics_process(delta):
	#print(velocidad)
	var direccion :int = 0

	if Globales.velo_jug == false and Globales.menos_velo == false:
		velocidad = 400

	if Globales.velo_jug == true and Globales.menos_velo == false:
		velocidad = 1000

	if Globales.menos_velo == true and Globales.velo_jug == false:
		velocidad = 200

	if Globales.vidas >= 4:
		Globales.vidas = 4

	if Globales.vidas <= 0:
		Globales.vidas = 0


	if 	Input.is_action_pressed("Mov_izquierda"):
			direccion = -1

	elif Input.is_action_pressed("Mov_derecha"):
			direccion = 1
	
	if Globales.congelado == false:
		velocity.x = direccion * velocidad
	
	if Globales.congelado == true:
		velocity = Vector2.ZERO
	
	move_and_slide()
	global_position.x = clamp(global_position.x,166,1235)

#func 
	#var lengua = escena_lengua.instantiate()
	#get_parent().add_child(lengua)
	#lengua.position = Jugador.position

func _on_timer_velo_timeout():
	Globales.velo_jug = false
	velocidad = 400


func _on_area_boca_area_entered(body):
	if body is Item:
		body._on_boca_tocada()
		if not body.enemigo:
			body.queue_free()

var invencible : bool = false
func perder_vida():
	if invencible: return
	Globales.vidas -= 1
	invencible = true
	modulate = Color(1,1,1,0.5)
	timer_inv.start()

func _on_timer_invencible_timeout():
	invencible = false
	modulate = Color(1,1,1,1)

func _on_menos_velo_timeout():
	Globales.menos_velo = false
	velocidad = 400
