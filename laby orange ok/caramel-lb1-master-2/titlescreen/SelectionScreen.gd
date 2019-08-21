extends Control

var scener1

func _ready():
	MainGlobal.charSelected = MainGlobal.textureChoice1
	$mainCont/sndpart/selection1/animMale.play("animCircle1")
	$mainCont/sndpart/selection2/circleFemale.hide()
	$ColorBlue.show()
	scener1 = preload("res://areas/main.tscn").instance() #faster with preload
	pass # Replace with function body.

func _on_Buttontoplay_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	#MainGlobal.sceneSelected = MainGlobal.world1
	

func _on_ReturnButton_pressed():
	get_tree().change_scene_to(MainGlobal.menuTitle)

func _on_ButtonMale_pressed():
	MainGlobal.charSelected = MainGlobal.textureChoice1
	$mainCont/sndpart/selection2/AnimFemale.stop()
	$mainCont/sndpart/selection2/circleFemale.hide()
	$mainCont/sndpart/selection1/circleMale.show()
	$mainCont/sndpart/selection1/animMale.play("animCircle1")
	$ColorBlue.show()
	$ColorOrange.hide()
	#print("char1")

func _on_ButtonFemale_pressed():
	MainGlobal.charSelected = MainGlobal.textureChoice2
	$mainCont/sndpart/selection1/animMale.stop()
	$mainCont/sndpart/selection1/circleMale.hide()
	$mainCont/sndpart/selection2/circleFemale.show()
	$mainCont/sndpart/selection2/AnimFemale.play("animTurnFemale")
	$ColorBlue.hide()
	$ColorOrange.show()
	#print("char2")
	

func _on_fadeIn_fadeIn_finished():
	add_child(scener1)
