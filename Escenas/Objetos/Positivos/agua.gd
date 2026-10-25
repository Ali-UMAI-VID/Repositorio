extends Item

class_name Agua

func _on_boca_tocada():
	var clave = str(Globales.sesion_juego) #ordena el numero de score en donde esta
	Globales.game_data["score_" + clave] += 20
