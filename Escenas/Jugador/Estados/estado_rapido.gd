extends Estado
class_name EstadoRapido
@onready var estado_normal = $"../EstadoNormal"

func entrada():
	print("Velo rapidaaaaaaaaa")
	Globales.velocidad = 1000
	print(Globales.velocidad)
	maquina.iniciar_timer(3.0)
