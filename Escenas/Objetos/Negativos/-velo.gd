extends Item
class_name EsposaEnemigo

@export var menos_velo : Timer

var tiempo_flash = 2

func _on_boca_tocada():
	Globales.nivel_escena.flash_yuta()
