extends Item

class_name EsposasEnemigo
@export var Timeresposas: Timer

func _on_boca_tocada():
	Globales.congelado = true
	Timeresposas.start()


func _on_congelado_timer_timeout():
	Globales.congelado = false
