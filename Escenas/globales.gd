extends Node

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

var nombre_uno: String		= "---"
var nombre_dos: String		= "---"
var nombre_tres: String		= "---"
var nombre_cuatro: String	= "---"
var nombre_cinco: String	= "---"
var numero_nombre: int = 0
#Datos de guardado
var save_path = "user://save_game.dat"

var sesion_juego : int = 0
var game_data : Dictionary = {
	"score_1": 0,
	"score_2": 0,
	"score_3": 0,
	"score_4": 0,
	"score_5": 0,
}
func save_game() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_var(game_data) #Guardamos la variable
	save_file = null #Para cerrar el archivo
	
func load_game() -> void:
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)
		
		game_data = save_file.get_var() 	# cargamos la variable
		save_file = null 	# Para cerrar el archivo
