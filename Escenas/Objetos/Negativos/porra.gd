extends Item

func _on_boca_tocada():
	Globales.jugador.perder_vida()
	Globales.score -= 20
	#print("hpalsd")
	#print(Globales.vidas)
	if Globales.score < 0:
		Globales.score = 0
