extends Node2D

@export var sprite_vidas = AnimatedSprite2D

func _physics_process(delta):
	sprite_vidas.frame = Globales.vidas
