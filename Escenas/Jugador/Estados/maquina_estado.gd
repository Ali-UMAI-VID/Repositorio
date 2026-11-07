extends Node
class_name MaquinaEstado
@export var estado_inicial : Estado
@onready var estado : Estado = estado_inicial
@onready var player : Jugador = get_parent()

@onready var timer_efectos = $TimerEfectos

func iniciar_timer(tiempo: float):
	timer_efectos.stop()
	timer_efectos.wait_time = tiempo
	timer_efectos.start()
	print("inicia_timer")
func transcicionar(nombre_estado: String):
	var nuevo_estado = get_node(nombre_estado)

	if estado == nuevo_estado:
		estado.entrada()
		return

	estado.salida()
	estado = nuevo_estado
	estado.entrada()

func _on_timer_efectos_timeout():
	transcicionar("EstadoNormal")
