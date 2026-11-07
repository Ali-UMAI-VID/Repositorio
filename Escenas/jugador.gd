extends CharacterBody2D

class_name Jugador

@export var gravedad : float = 15
#@export var animacion_lengua : AnimationPlayer
@export var area_boca : Area2D
@export var timer_inv : Timer
@onready var maquina_estado = $MaquinaEstado

var vida : float = 3

func _ready():
	Globales.jugador = self

func _physics_process(delta):

	if Globales.vidas >= 4:
		Globales.vidas = 4

	if Globales.vidas <= 0:
		Globales.vidas = 0

	global_position.x = clamp(global_position.x,164,1229)

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

func actualizar_colision():
	if Globales.velocidad == 1000:
		collision_mask = 1
	elif Globales.velocidad == 200:
		collision_mask = 3
	else:
		collision_mask = 3








func _on_area_boca_area_entered(area):
	if area.is_in_group("marihuana"):
		maquina_estado.transcicionar("EstadoRapido")

	elif area.is_in_group("esposas"):
		maquina_estado.transcicionar("EstadoLento")

	elif area.is_in_group("pimienta"):
		maquina_estado.transcicionar("EstadoQuieto")

	if area is Item:
		area._on_boca_tocada()

		if not area.enemigo:
			area.queue_free()
