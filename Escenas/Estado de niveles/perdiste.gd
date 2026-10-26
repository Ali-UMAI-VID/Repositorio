extends Control

#@export_file var escena_skin: String
@export var sonido_boton: AudioStreamPlayer2D
@export_file_path("*.tscn") var escena_menu_path : String
@export_file_path("*.tscn") var escena_nivel_path : String
#@onready var escena_menu : PackedScene = load(escena_menu_path)
#@onready var escena_nivel : PackedScene = load(escena_nivel_path)
@export var PosJugador : TextureRect

@export var BotonRenaudar : AnimatedSprite2D
@export var BotonMenu : AnimatedSprite2D
@export var BotonOpciones : AnimatedSprite2D
@export var BotonSalir : AnimatedSprite2D

@onready var score_txt_5 = $ScoreTxt5
@onready var score_txt_4 = $ScoreTxt4
@onready var score_txt_3 = $ScoreTxt3
@onready var score_txt_2 = $ScoreTxt2
@onready var score_txt_actual = $ScoreTxtActual
var ranking = [1,2,3,4,5]
var posiciones_y = [70 , 276, 482, 688, 894]

func _ready():
	pass
	#print(Globales.game_data["score_1"])
	#print(Globales.score_actual)
	#Globales.game_data["score_2"] = 200
	#Globales.game_data["score_3"] = 1000
	#actualizar_posicion_score()

func _process(delta):

	score_txt_actual.text = Globales.game_data["nombre_1"] + ": " + str(Globales.game_data["score_1"])
	score_txt_2.text = Globales.game_data["nombre_2"] + ": " + str(Globales.game_data["score_2"])
	score_txt_3.text = Globales.game_data["nombre_3"] + ": " + str(Globales.game_data["score_3"])
	score_txt_4.text = Globales.game_data["nombre_4"] + ": " + str(Globales.game_data["score_4"])
	score_txt_5.text = Globales.game_data["nombre_5"] + ": " + str(Globales.game_data["score_5"])
	actualizar_posicion_score()
	
	if PosJugador.position.y == 492:
		BotonRenaudar.frame = 1
		BotonMenu.frame = 0
		BotonOpciones.frame = 0
		BotonSalir.frame = 0
		
		if 	Input.is_action_pressed("Espacio"):
			Globales.vidas = 3
			Globales.game_data["score_" + str(Globales.game_data["sesion_juego"])] = 0
			sonido_boton.play()
			Globales.score_actual = 0
			get_tree().change_scene_to_file(escena_nivel_path)
	if PosJugador.position.y == 619.5:
		BotonRenaudar.frame = 0
		BotonMenu.frame = 1
		BotonOpciones.frame = 0
		BotonSalir.frame = 0
		if 	Input.is_action_pressed("Espacio"):
		#	if Globales.game_data["score_1"] >= 0:
		#		Globales.game_data["score_2"] = Globales.game_data["score_1"]
		#		Globales.game_data["score_1"] = 0
			Globales.vidas = 3
			Globales.nivel = 0
			sonido_boton.play()
			Globales.score_actual = 0
			await get_tree().change_scene_to_file(escena_menu_path)
	if PosJugador.position.y == 747:
		BotonRenaudar.frame = 0
		BotonMenu.frame = 0
		BotonOpciones.frame = 1
		BotonSalir.frame = 0
	if PosJugador.position.y == 874.5:
		BotonRenaudar.frame = 0
		BotonMenu.frame = 0
		BotonOpciones.frame = 0
		BotonSalir.frame = 1
		if 	Input.is_action_pressed("Espacio"):
			sonido_boton.play()
			get_tree().quit()


func _physics_process(delta):
	if Input.is_action_just_pressed("Mov_abajo"):
		PosJugador.position.y += 127.5
		#print (PosJugador.position.y)
	if Input.is_action_just_pressed("Mov_arriba"):
		PosJugador.position.y -= 127.5
		#print(PosJugador.position)
	#PosJugador.position.x = clamp(PosJugador.position.x,317,555)
	PosJugador.position.y = clamp(PosJugador.position.y,492,874.5)

func actualizar_posicion_score():
	var scores = [
		Globales.game_data["score_1"],
		Globales.game_data["score_2"],
		Globales.game_data["score_3"],
		Globales.game_data["score_4"],
		Globales.game_data["score_5"]
	]

	var labels = [
		score_txt_actual,
		score_txt_2,
		score_txt_3,
		score_txt_4,
		score_txt_5
	]

	# Ordenamos los índices según el puntaje
	var indices = [0, 1, 2, 3, 4]

	indices.sort_custom(func(a, b):
		return scores[a] > scores[b]
	)

	# Asignamos ranking y posición Y
	for i in range(indices.size()):

		var indice = indices[i]

		ranking[indice] = i + 1

		labels[indice].position.y = posiciones_y[i]
