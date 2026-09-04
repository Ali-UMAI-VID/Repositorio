extends Area2D
class_name interfaz
@export var jugador_interfaz: Area2D
@onready var skin_bloq : AnimatedSprite2D


func _on_area_entered(area):
	if area.name == "Area_pos_jug":
		$AnimatedSprite2D.frame = 1


func _on_area_exited(area):
	if area.name == "Area_pos_jug":
		$AnimatedSprite2D.frame = 0
