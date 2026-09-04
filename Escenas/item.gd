extends Area2D

class_name Item

@export var gravedad : float = 500	#velocidad en la que cae el enemigoo
@export var enemigo : bool

var golpeado: bool

func _physics_process(delta: float) -> void:
	position.y += gravedad * delta
	#if enemigo:
		#for body in get_overlapping_areas():
			#if body.name == "AreaBoca" and not golpeado:
				#_on_boca_tocada()
				#golpeado = true

func _on_boca_tocada():
	pass
