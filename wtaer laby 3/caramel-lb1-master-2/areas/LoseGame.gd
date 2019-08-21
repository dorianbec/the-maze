extends Control

var selectedScene 
var mainReset = load("res://areas/main.tscn")

func _ready():
	if mMainZone.is_playing():
		mMainZone.stop()
	#pass # Replace with function body.

func _on_ButBackMenu_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	selectedScene = MainGlobal.menuTitle

func _on_ButRestart_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	MainGlobal.fonctionResetCpt()
	selectedScene = mainReset
	
func _on_fadeIn_fadeIn_finished():
	get_tree().change_scene_to(selectedScene)
