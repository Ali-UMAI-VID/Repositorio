extends Node

func _ready():
	load_game()

var jugador : Jugador
var score : int = 0
var timer : float = 60
var vidas : int = 3
var pucho : bool = false
var nivel : int = 0
var nivel_escena : Node2D

var flashbang: bool = false
var velo_jug : bool = false
var menos_velo: bool = true
var congelado : bool = false

#var nombre_1: String		= "---"
#var nombre_2: String		= "---"
#var nombre_3: String		= "---"
#var nombre_4: String	= "---"
#var nombre_5: String	= "---"

#var numero_nombre: int = 0
var nombre_nuevo: String = "---"
#Datos de guardado
var save_path = "user://save_game.dat"

var game_data : Dictionary = {
	"score_1": 0,
	"score_2": 0,
	"score_3": 0,
	"score_4": 0,
	"score_5": 0,
	
	"nombre_1": "---",
	"nombre_2": "---",
	"nombre_3": "---",
	"nombre_4": "---",
	"nombre_5": "---",
	"numero_nombre": 0,
	
	"sesion_juego" : 0,

}

var score_actual: int = 0
var ganaste: bool = false

func menor_puntaje() -> int:
	var menor_score: int = game_data["score_1"]
	var indice_menor: int = 1

	for i in range(2, 6):
		var clave = "score_" + str(i)

		if game_data[clave] < menor_score:
			menor_score = game_data[clave]
			indice_menor = i

	if score_actual > menor_score:
		game_data["score_" + str(indice_menor)] = score_actual
		return indice_menor

	return 0

func save_game() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	if save_file:
		save_file.store_var(game_data)
		save_file.close()

func load_game() -> void:
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)
		if save_file:
			game_data = save_file.get_var()
			save_file.close()
