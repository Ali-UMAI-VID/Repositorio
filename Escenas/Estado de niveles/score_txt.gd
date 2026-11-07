extends Label
var score_text_valor: String = ""
var score_txt: String = ""

func _process(delta):
	score_text_valor = str(Globales.score_actual)
	text = score_txt + score_text_valor
