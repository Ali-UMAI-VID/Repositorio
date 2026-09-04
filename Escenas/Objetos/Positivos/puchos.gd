extends Item
class_name Puchito

func _on_boca_tocada():
	Globales.pucho = true
	Globales.timer += 15
