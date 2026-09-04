extends CharacterBody2D

class_name Enemigo

@export var velocidad: float = 200
@export var gravedad : float = 200	#velocidad en la que cae el enemigoo

func _physics_process(delta: float) -> void:
	velocity.y = gravedad
	move_and_slide()
	pass
