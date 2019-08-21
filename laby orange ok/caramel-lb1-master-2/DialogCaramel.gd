extends Polygon2D

var cpt = 0
var text = ["Greetings!", "My name is Caramel", "I am the guardian of this place.", 
"If you got the Grimoire and the wand,", "You will be able to see the portal."]

func _ready():
	pass
func _input(event):
	if Input.is_action_just_pressed("ui_up") && MainGlobal.DialogZone:
		$".".show()
		loadTextCaramel()

func loadTextCaramel():
	var cptt = 0
	for i in text: 
		cptt +=1 
	if cpt < cptt:
		$dialogueCaramel.set_text(text[cpt])
		cpt+=1
	elif cpt >=cptt:
		$".".hide()
		cptt = 0
		cpt = 3 #<-- recommence à la phrase pertinente

	