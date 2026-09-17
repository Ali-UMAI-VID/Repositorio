extends Node2D
#@export var escena_perdiste : PackedScene
#@export var escena_ganaste : PackedScene
@export_file_path("*.tscn") var escena_perdiste_path : String
@export_file_path("*.tscn") var escena_ganaste_path : String
@onready var flash_animation = $Juego/Flash_animation

func _ready():
	Globales.nivel_escena = self

func _on_area_muerte_body_entered(body):
	if body is Enemigo:
		body.queue_free()

func _process(delta):
	if Globales.flashbang == true and Globales.vidas > 0:
		flash_animation.play("flashes_nivel")
		await flash_animation.animation_finished
		Globales.flashbang = false
	Globales.nivel = 1
	Globales.timer -= delta
	if Globales.timer <= 0:
		print("xd")
		get_tree().change_scene_to_file(escena_ganaste_path)
	if Globales.vidas <= 0:
		get_tree().change_scene_to_file(escena_perdiste_path)

var tiempo_flash = 2

func flash_yuta():
	Globales.menos_velo = true
	Globales.velo_jug = false
	flash_animation.play("flashes_esposa")
	await get_tree().create_timer(tiempo_flash).timeout
	flash_animation.stop()
	Globales.menos_velo = false
