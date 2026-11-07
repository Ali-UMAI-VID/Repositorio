extends Estado
class_name EstadoQuieto

func entrada():
	print("quietotootototooooooooooooooooo")	
	Globales.velocidad = 0
	maquina.iniciar_timer(3.0)
	print(Globales.velocidad)
