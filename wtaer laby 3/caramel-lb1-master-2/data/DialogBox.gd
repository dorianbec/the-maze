extends Polygon2D

#Un dico global pour stocker le parsing sur le fichier json
var dict = {} 
var cpt = 0
var text1 = ["Bravo!", "You did it!", "I'm proud of you!"]
var _toFinalScene

func _ready():
	_toFinalScene = load("res://areas/EndGame.tscn")
#	var file = File.new()
#	file.open("res://data/Dialog.json", file.READ)
#	var text = file.get_as_text()
#	dict = JSON.parse(text).result
#
#	file.close()
	#print(dict["id1"]["name"])
	pass
	
	
func _input(event):
	if Input.is_action_just_pressed("ui_up") && MainGlobal.DialogZone:
		$".".show()
		loadTextFinal()
		
func loadTextFinal():
	var cptt = 0
	for i in text1: 
		#compter le nb de lignes de texte ds la section (id1, text)
		cptt +=1 
		
	#On envoie les infos dans la boîte à dialogue:
	if cpt < cptt:
#		$DialogGetter.set_text(dict["id4"]["text"][cpt])
		$DialogGetter.set_text(text1[cpt])
		cpt+=1
		#print(cpt)
	elif cpt >=cptt:
		$".".hide()
		cptt = 0
		#$DialogGetter.set_text(dict["id1"]["text2"][0])
		get_tree().change_scene_to(_toFinalScene)

#func _on_finalBoss_body_entered(body):
#	if body.is_in_group("Players"):
#		MainGlobal.DialogZone =true
##		MainGlobal.playButtonA = true
#
#func _on_finalBoss_body_exited(body):
#	$".".hide()
#	MainGlobal.DialogZone =false
##	MainGlobal.playButtonA = false
	
	

#########################
#MODELE 1
########################
#	var p = JSON.parse('["hello", "world", "!"]')
#	if typeof(p.result) == TYPE_ARRAY:
#	    print(p.result[0]) # prints 'hello'
#	else:
#	    print("unexpected results")

#########################
#MODELE 2
########################
#var text_json = "{\"error\": false, \"data\": {\"player_id\": 1}}"
#var result_json = JSON.parse(text_json)
#var result = {}
#
#if result_json.error == OK:  # If parse OK
#    var data = result_json.result
#    print(data)
#else:  # If parse has errors
#    print("Error: ", result_json.error)
#    print("Error Line: ", result_json.error_line)
#    print("Error String: ", result_json.error_string)

########################
#NOTE : Bug lors d'une exportation en .exe : le fichier json n'est pas lu...
#####################################


