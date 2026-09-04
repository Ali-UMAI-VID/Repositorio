extends Item
class_name PlacaItem
	
func _on_boca_tocada():
	Globales.jugador.perder_vida()
	Globales.score -= 30
	#print("hpalsd")
	#print(Globales.vidas)
	if Globales.score < 0:
		Globales.score = 0
