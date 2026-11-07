extends Estado
class_name EstadoNormal

@onready var animacion_jugador = $"../../AnimacionJugador"

func entrada():
	print("Velo normalllllllll")
	Globales.velocidad = 400
	print(Globales.velocidad)

	maquina.player.actualizar_colision()

func _process(delta):
	#print(Globales.velocidad)
	var direccion: int = 0
	if Input.is_action_pressed("Mov_izquierda"):
			direccion = -1
			#Globales.direccion_jugador = Vector2.LEFT
	if Input.is_action_pressed("Mov_derecha"):
			direccion = 1
			#Globales.direccion_jugador = Vector2.RIGHT
	maquina.player.velocity.x = direccion * Globales.velocidad
	maquina.player.move_and_slide()
