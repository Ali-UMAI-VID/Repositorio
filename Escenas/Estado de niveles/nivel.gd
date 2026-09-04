extends Node2D
#@export var escena_perdiste : PackedScene
#@export var escena_ganaste : PackedScene
@export_file_path("*.tscn") var escena_perdiste_path : String
@export_file_path("*.tscn") var escena_ganaste_path : String

func _on_area_muerte_body_entered(body):
	if body is Enemigo:
		body.queue_free()

func _process(delta):
	Globales.nivel = 1
	Globales.timer -= delta
	if Globales.timer <= 0:
		print("xd")
		get_tree().change_scene_to_file(escena_ganaste_path)
	if Globales.vidas <= 0:
		get_tree().change_scene_to_file(escena_perdiste_path)
