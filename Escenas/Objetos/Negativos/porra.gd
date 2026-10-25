extends Item
var duracion_flas: int = 5


func _on_boca_tocada():
	var clave = str(Globales.sesion_juego) #ordena el numero de score en donde esta
	Globales.jugador.perder_vida()
	Globales.flashbang = true
	Globales.game_data["score_" + clave] -= 20
	#print("hpalsd")
	#print(Globales.vidas)
	if Globales.game_data["score_" + clave] < 0:
		Globales.game_data["score_"  + clave] = 0
#	flash()

#func flash():
#	var tween = create_tween()
	
	# Empieza invisible
#	flashbang.modulate.a = 0.0
	
	# Sube la opacidad
#	tween.tween_property(flashbang, "modulate:a", 1.0, 0.5)
	
	# Baja la opacidad
#	tween.tween_property(flashbang, "modulate:a", 0.0, 0.5)
	
	# Repetir varias veces
#	tween.set_loops(5)
