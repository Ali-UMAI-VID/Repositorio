extends Node2D
#@export var escena_perdiste : PackedScene
#@export var escena_ganaste : PackedScene

func _on_area_muerte_body_entered(body):
	if body is Enemigo:
		body.queue_free()

func _process(delta):
	Globales.nivel = 1
	Globales.timer -= delta
	if Globales.timer <= 0:
		print("xd")
		#get_tree().change_scene_to_packed(escena_ganaste)
	if Globales.vidas <= 0:
		pass
		#get_tree().change_scene_to_packed(escena_perdiste)
