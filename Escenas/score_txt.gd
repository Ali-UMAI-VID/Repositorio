extends Label

var score_text: String = str(Globales.score)
var score_txt = "Score: "

func _process(delta):
	score_text = str(Globales.score)
	text = score_txt + score_text
	#print (score_text)
