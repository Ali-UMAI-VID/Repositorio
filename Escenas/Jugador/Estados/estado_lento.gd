extends Estado
class_name EstadoLento

func entrada():
	print("Velo lentooooooooooooooooo")
	Globales.velocidad = 100
	print(Globales.velocidad)
	maquina.iniciar_timer(3.0)
	#maquina.movimiento_lateral_activado = false
	#maquina.player.velocity = Vector2.ZERO
