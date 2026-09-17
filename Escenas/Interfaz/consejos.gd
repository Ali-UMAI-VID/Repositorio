extends Control
@onready var textos_random = $FondoConsejos/TextosRandom
@export_file_path("*.tscn") var escena_nivel_path : String
@onready var timer_consejo = $TimerConsejo

var textos = [
	"¡Cuidado!",
	"El enemigo está cerca...",
	"¿Dónde estará?",
	"Algo no parece estar bien...",
	"Tenés que encontrarlo."
]

func _ready():
	timer_consejo.start()
	var texto_elegido = textos.pick_random()
	textos_random.text = texto_elegido

func _on_timer_consejo_timeout():
	get_tree().change_scene_to_file(escena_nivel_path)
