extends Item
class_name PlacaItem
	
func _on_boca_tocada():
	Globales.jugador.perder_vida()
	Globales.score_actual -= 50
	if Globales.score_actual < 0:
		Globales.score_actual = 0
