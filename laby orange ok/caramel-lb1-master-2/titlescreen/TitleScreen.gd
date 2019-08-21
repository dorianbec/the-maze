extends Control
var loader
var wait_frames
var time_max = 100 # msec
var current_scene

var colors = Gradient.new()
var colors_array = [Color(1, .5, .5), Color(.5, .5, 1), Color(.5,.5,1)]
var box_size = Vector2.ZERO
onready var box  = $BGcolor

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
	if MainGlobal.boolMenuSound && MainGlobal.enableAudio:
		if !(mMenu.is_playing()):
			mMenu.play()

func _on_play_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	MainGlobal.sceneSelected = MainGlobal.menuSelection
	
func _on_rules_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	MainGlobal.sceneSelected = MainGlobal.menuRules
	
func _on_credits_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	mMenu.stop()
	MainGlobal.sceneSelected = MainGlobal.menuCredits

func _on_Buttonfull1_pressed():
	MainGlobal.fonctionFullscreen()

func _on_Buttonsound1_pressed():
	if MainGlobal.enableAudio == false:
		#pause Audio
		mMenu.set_stream_paused(MainGlobal.enableAudio)  
		if mMenu.is_playing()==false:
			mMenu.play()
	else :
		#unpause Audio
		mMenu.set_stream_paused(MainGlobal.enableAudio) 
	MainGlobal.enableAudio = !MainGlobal.enableAudio #(switch true false)

#func _on_ButtonLOL_pressed():
#	MainGlobal.charSelected = MainGlobal.textureChoice2
#	PL.set_texture(MainGlobal.charSelected)

func _on_fadeIn_fadeIn_finished():	
	get_tree().change_scene_to(MainGlobal.sceneSelected)
	

#Confirmation pour quitter le jeu : Fenetre + action sur ok
func _on_ButtonExit_pressed():
	$ConfirmClose/ConfirmationDialog.show()
func _on_ConfirmationDialog_confirmed():
	get_tree().quit()
