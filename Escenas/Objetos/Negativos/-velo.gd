extends Item
class_name EsposaEnemigo

@export var menos_velo : Timer

func _on_boca_tocada():
	Globales.menos_velo = true
	Globales.velo_jug = false
	menos_velo.start()

func _on_timer_maria_timeout():
	Globales.menos_velo = false
