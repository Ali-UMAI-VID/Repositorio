extends Node2D
const escena_vinilo = preload("uid://cmg1qdfm2gn71")
const escena_disco = preload("uid://bsteskqnltmjo")
const escena_agua = preload("uid://dpwbpx2qs5fp1")
const ESPOSAS = preload("uid://d02stx26n8evi")
const ENCENDEDOR = preload("uid://d03y56mb8s2u4")

const escena_micro = preload("uid://6mfrct2khwgp")

const PIMIENTA_CONGELA = preload("uid://bu7rs1ug43q42")

const escena_placa = preload("uid://daox7cx03xwwd")
const PORRA = preload("uid://cd2l5b6s68q7u")
const SPEED = preload("uid://lhy0toald5kc")

const escena_puchos = preload("uid://bdf4254vxb1jr")

const objetos_nivel_1_a = [escena_vinilo, ENCENDEDOR,escena_puchos,escena_disco,escena_agua, PORRA,escena_micro, SPEED, ESPOSAS, PIMIENTA_CONGELA,escena_placa]
const objetos_nivel_1_b = [escena_vinilo, ENCENDEDOR,escena_puchos,escena_disco,escena_agua, PORRA,escena_micro, SPEED, ESPOSAS, PIMIENTA_CONGELA,escena_placa]

const prob_objetos_normal = [0, 15, 20, 30, 40, 60, 65, 75, 0, 80,90]
const prob_objetos_30 = [5, 15, 20, 30, 40, 60, 65, 70, 75, 80,90]
#const escena_enemigo = preload("res://Escenas/Maria.tscn")
func spawn_enemigos():
	if Globales.nivel != 1:
		return

	var enemigo : Node2D
	var enemigo_elegido := false

	var probabilidades

	if Globales.timer > 30:
		probabilidades = prob_objetos_normal
	else:
		probabilidades = prob_objetos_30

	while not enemigo_elegido:
		var indice = randi_range(0, objetos_nivel_1_a.size() - 1)

		if randi_range(0, 100) <= probabilidades[indice]:
			enemigo = objetos_nivel_1_a[indice].instantiate()
			enemigo_elegido = true

	add_child(enemigo)

	enemigo.position.x = randf_range(160, 1180)
