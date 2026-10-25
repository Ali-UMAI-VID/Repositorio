extends Item
class_name PlacaItem
	
func _on_boca_tocada():
	var clave = str(Globales.sesion_juego) #ordena el numero de score en donde esta
	Globales.jugador.perder_vida()
	Globales.game_data["score_" + clave] -= 50
	#print("hpalsd")
	#print(Globales.vidas)
	if Globales.game_data["score_" + clave] < 0:
		Globales.game_data["score_" + clave] = 0
