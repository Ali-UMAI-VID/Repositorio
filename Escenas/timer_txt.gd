extends Label

var timer_txt: String = str(int(Globales.timer))
#var tiempo_acumulado: float = 0.0	# Variable local para acumular el tiempo

func _process(delta: float) -> void:
	timer_txt = str(int(Globales.timer))
	text = timer_txt
	# Sumamos el tiempo de cada frame
	#tiempo_acumulado += delta
	# Verificamos si ha pasado 1 segundo o más
	#if tiempo_acumulado >= 1.0:
	#	tiempo_acumulado -= 1.0 # Restablecemos el acumulador manteniendo la precisión
		# Modificamos nuestra variable global
	#	Globales.timer -= 1
		#print("Timer: ", Globales.timer)
