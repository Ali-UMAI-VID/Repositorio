extends Item
class_name EsposaEnemigo
@onready var duracion_menos_velo = $DuracionMenosVelo
@export var menos_velo : Timer

var tiempo_flash = 2

func _on_boca_tocada():
	#Globales.velo_normal = false
	#Globales.menos_velo = true
	Globales.nivel_escena.flash_yuta()
	#duracion_menos_velo.start()
#
#func _on_duracion_menos_velo_timeout():
	#Globales.menos_velo = false
	#Globales.velo_normal = true
