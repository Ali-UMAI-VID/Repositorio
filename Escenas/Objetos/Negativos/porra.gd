extends Item
var duracion_flas: int = 5


func _on_boca_tocada():
	Globales.jugador.perder_vida()
	Globales.flashbang = true
	Globales.score -= 20
	#print("hpalsd")
	#print(Globales.vidas)
	if Globales.score < 0:
		Globales.score = 0
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
