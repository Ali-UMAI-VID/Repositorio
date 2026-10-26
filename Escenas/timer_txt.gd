extends Label

var timer_txt: String = str(int(Globales.timer))
#var tiempo_acumulado: float = 0.0	# Variable local para acumular el tiempo

func _process(delta: float) -> void:
	timer_txt = str(int(Globales.timer))
	text = timer_txt
