extends Control
@onready var textos_random = $FondoConsejos/TextosRandom
@export_file_path("*.tscn") var escena_nivel_path : String
@onready var timer_consejo = $TimerConsejo
@onready var letra_1 = $Letra1
@onready var letra_2 = $Letra2
@onready var letra_3 = $Letra3
@onready var posicion_jugador = $PosicionJugador

var textos = [
	"¡Cuidado!",
	"El enemigo está cerca...",
	"¿Dónde estará?",
	"Algo no parece estar bien...",
	"Tenés que encontrarlo."
]

var letras = [
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
	"k", "l", "m", "n", "o", "p", "q", "r", "s",
	"t", "u", "v", "w", "x", "y", "z",
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
	"/", "*", "!", "@", "#", "$", "%", "&", "(", ")",
	"?", "<", ">", "’", "{", "}"
]

# Un índice para cada una de las 3 letras
var indices_letras: Array[int] = [0, 0, 0]

func _ready():
	Globales.game_data["sesion_juego"] += 1
	textos_random.text = textos.pick_random()
	actualizar_interfaz_letras()

func _unhandled_input(event):
	# Movimiento de posición
	if event.is_action_pressed("Mov_derecha") and posicion_jugador.position.y == 410:
		posicion_jugador.position.x += 280
	elif event.is_action_pressed("Mov_izquierda") and posicion_jugador.position.y == 410:
		posicion_jugador.position.x -= 280
	elif event.is_action_pressed("Mov_arriba"):
		posicion_jugador.position.y -= 240
	elif event.is_action_pressed("Mov_abajo"):
		posicion_jugador.position.y += 240

	# Clampear posición del cursor
	posicion_jugador.position.y = clamp(posicion_jugador.position.y, 410, 650)
	posicion_jugador.position.x = clamp(posicion_jugador.position.x, 100, 660)

	# Interacción con la tecla Espacio
	if event.is_action_pressed("Espacio"):
		if posicion_jugador.position.y == 650:
			confirmar_y_cambiar_escena()
		else:
			avanzar_letra_actual()

func obtener_columna_actual() -> int:
	match int(posicion_jugador.position.x):
		100: return 0
		380: return 1
		660: return 2
		_: return -1

func avanzar_letra_actual():
	var col = obtener_columna_actual()
	if col != -1:
		indices_letras[col] = (indices_letras[col] + 1) % letras.size()
		actualizar_interfaz_letras()

func actualizar_interfaz_letras():
	if letra_1: letra_1.text = letras[indices_letras[0]]
	if letra_2: letra_2.text = letras[indices_letras[1]]
	if letra_3: letra_3.text = letras[indices_letras[2]]

func confirmar_y_cambiar_escena():
	var nombre_completo = letras[indices_letras[0]] + letras[indices_letras[1]] + letras[indices_letras[2]]

	Globales.nombre_nuevo = nombre_completo

	if Globales.game_data["sesion_juego"] <= 5:
		Globales.game_data["numero_nombre"] += 1

		match Globales.game_data["numero_nombre"]:
		
			1: Globales.game_data["nombre_1"] = nombre_completo
			2: Globales.game_data["nombre_2"] = nombre_completo
			3: Globales.game_data["nombre_3"] = nombre_completo
			4: Globales.game_data["nombre_4"] = nombre_completo
			5: Globales.game_data["nombre_5"] = nombre_completo

	Globales.nivel = 1
	get_tree().change_scene_to_file(escena_nivel_path)
