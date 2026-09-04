extends Item
class_name SpeedEnemigo
@onready var jugador : Jugador = get_tree().get_first_node_in_group("jugador")
@export var timer_velo : Timer

func _on_boca_tocada():
	Globales.velo_jug = true
	Globales.menos_velo = false
	timer_velo.start()


func _on_timer_speed_timeout():
	Globales.velo_jug = false
