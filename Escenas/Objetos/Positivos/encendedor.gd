extends Item
class_name Encendedor

func _on_boca_tocada():
	Globales.score += 10
	if Globales.pucho == true:
		Globales.score += 60
		Globales.pucho = false
