extends CanvasLayer


#signal start_game
var selectedScene 
var mainReset
var backMenu


func _ready():
	$POPUPMC.hide()
	mainReset = load("res://areas/main.tscn")
	backMenu = load("res://titlescreen/TitleScreen.tscn")

func update_baguette(cptbag):
	$HUDMC/MainC/H2/Baguettelabel.text =str(MainGlobal.cptbag)+"/1"
	#print(MainGlobal.cptbag)
	#$Baguettelabel.text = str(cptbag)+"/1"
	
func update_codex(cptcodex):
	$HUDMC/MainC/H3/Codexlabel.text = str(MainGlobal.cptcodex)+"/1"
func update_etoile(cptetoile):
	$HUDMC/MainC/H1/Etoilelabel.text = str(MainGlobal.cptetoile)+" "

#Bouton du menu:
func _on_Buttonclose_pressed():
	$POPUPMC.hide()
func _on_Buttonopenmenu_pressed():
	$POPUPMC.show()


func _on_Buttonreset_pressed():
	$fadeIn.show()
	$fadeIn.fade_in()
	MainGlobal.fonctionResetCpt()
	selectedScene = mainReset
	#get_tree().change_scene("res://areas/main.tscn")
	
func _on_Buttonaudio_pressed():
	MainGlobal.enableAudio = !MainGlobal.enableAudio #switch
	
	if MainGlobal.enableAudio == true:
		mMainZone.set_stream_paused(false) 
		#print(MainGlobal.enableAudio)
		
		if mMainZone.is_playing()==false: 
			mMainZone.play()
			#evite le non-chargement d'audio après des changements de scenes
	else :
		mMainZone.set_stream_paused(true)

func _on_Buttonhome_pressed():
	#temporaire
	$fadeIn.show()
	$fadeIn.fade_in()
	mMainZone.stop()
	MainGlobal.boolMenuSound = true
	MainGlobal.fonctionResetCpt()
	selectedScene = backMenu

func _on_Buttonwindow_pressed():
	MainGlobal.fonctionFullscreen()

func _on_fadeIn_fadeIn_finished():
	get_tree().change_scene_to(selectedScene)

func _on_closeButRules1_pressed():
	$POPUPRULES.hide()
	$POPUPBG.hide()
func _on_nextButton_pressed():
	$POPUPRULES.hide()
	$POPUPRULES2.show()
func _on_closeButRules2_pressed():
	$POPUPRULES2.hide()
	$POPUPBG.hide()
func _on_prevButton_pressed():
	$POPUPRULES2.hide()
	$POPUPRULES.show()
func _on_Buttonobj_pressed():
	$POPUPBG.show()
	$POPUPMC.hide()
	$POPUPRULES.show()
