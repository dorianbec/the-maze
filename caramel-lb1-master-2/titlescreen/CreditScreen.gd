extends Control

func _ready():
	if MainGlobal.enableAudio == true:
		if !mCredits.is_playing():
			mCredits.play()
	

func _on_ReturnButton_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	MainGlobal.boolMenuSound = true
	

func _on_fadeIn_fadeIn_finished():
	mCredits.stop()
	get_tree().change_scene_to(MainGlobal.menuTitle)
	

func _on_ReturnButton2_pressed():
	get_tree().change_scene_to(MainGlobal.menuCredits2)
