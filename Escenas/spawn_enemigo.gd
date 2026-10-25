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

const objetos_nivel = [escena_vinilo, ENCENDEDOR,escena_puchos,escena_disco,escena_agua, PORRA,escena_micro, SPEED, ESPOSAS, PIMIENTA_CONGELA,escena_placa]
#1. vinilo-> suma 2 vidas
#2. encendedor suma +score + cigarros
#3. puchos -> +tiempo
#4. disco->+1 vida
#5. agua + 15score
#6. porra -vida - score
#7. micro + score
#8. marijuana -> +velocida
#9. esposas - velocidad
#10.pimienta congela
#11.placa - vida -50score
var prob_objetos_normal_nv1 = [0, 15, 20, 20, 40, 60, 40, 35, 0, 40,0]	#antes de los treinta segundos aparece
const prob_objetos_30_nv1 = [0, 15, 20, 20, 40, 60, 40, 35, 75, 40,90]	#despues de los treinta segundos aparece

var prob_objetos_normal_nv2 = [0, 15, 20, 20, 40, 70, 50, 50, 0, 80,80]
const prob_objetos_30_nv2 = [5, 15, 20, 20, 40, 70, 50, 50, 50, 80,80]

var prob_objetos_normal_nv3 = [2, 15, 20, 15, 20, 75, 30, 50, 75, 90,90]
const prob_objetos_30_nv3 = [2, 15, 20, 15, 40, 75, 65, 50, 75, 90,90]
#const escena_enemigo = preload("res://Escenas/Maria.tscn")
func spawn_enemigos():
	if Globales.nivel == 0:
		return

	var enemigo : Node2D
	var enemigo_elegido :bool = false

	var probabilidades

	if Globales.timer > 30 and Globales.nivel ==1:
		probabilidades = prob_objetos_normal_nv1
	else:
		probabilidades = prob_objetos_30_nv1
	
	if Globales.timer > 30 and Globales.nivel ==2:
		probabilidades = prob_objetos_normal_nv2
	else:
		probabilidades = prob_objetos_30_nv2
	
	if Globales.timer > 30 and Globales.nivel ==3:
		probabilidades = prob_objetos_normal_nv3
	else:
		probabilidades = prob_objetos_30_nv3

	while not enemigo_elegido:
		var indice = randi_range(0, objetos_nivel.size() - 1)

		if randi_range(0, 100) <= probabilidades[indice]:
			enemigo = objetos_nivel[indice].instantiate()
			enemigo_elegido = true

	add_child(enemigo)
	enemigo.position.x = randf_range(160, 1180)
