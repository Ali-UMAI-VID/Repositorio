extends Item
class_name Encendedor

func _on_boca_tocada():
	Globales.score_actual += 10
	if Globales.pucho == true:
		Globales.score_actual += 60
		Globales.pucho = false
