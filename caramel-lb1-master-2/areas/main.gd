extends Node


func _ready():
	$HUD.update_baguette(MainGlobal.cptbag) 
	$HUD.update_codex(MainGlobal.cptcodex) 
	$HUD.update_etoile(MainGlobal.cptetoile) 
	$HUD/POPUPBG.show()
	$HUD/POPUPRULES.show()

	#stop menu music
	mMenu.stop()
	#print(MainGlobal.enableAudio)
	if MainGlobal.enableAudio:
		mMainZone.play()

func _on_baguette2_hit():
	MainGlobal.cptbag +=1
	$HUD.update_baguette(MainGlobal.cptbag)
	#$HUD/GUI.updatetest(cptbag)

func _on_codexv2_hit():
	MainGlobal.cptcodex +=1
	$HUD.update_codex(MainGlobal.cptcodex)

func _on_etoile_hit():
	MainGlobal.cptetoile+=1
	#On lance la fonction qu'on aura ecrit dans le HUD
	$HUD.update_etoile(MainGlobal.cptetoile)
func _on_etoile2_hit():
	MainGlobal.cptetoile+=1
	$HUD.update_etoile(MainGlobal.cptetoile)
func _on_etoile3_hit():
	MainGlobal.cptetoile+=1
	$HUD.update_etoile(MainGlobal.cptetoile)
func _on_etoile4_hit():
	MainGlobal.cptetoile+=1
	$HUD.update_etoile(MainGlobal.cptetoile)
func _on_etoile5_hit():
	MainGlobal.cptetoile+=1
	$HUD.update_etoile(MainGlobal.cptetoile)

#func _on_codexv2_body_entered(body):# test de changement de scene
#	get_tree().change_scene_to(next_scene)

func _on_Button_pressed():
	get_tree().reload_current_scene()
	MainGlobal.cptbag =0
	MainGlobal.cptcodex =0
	MainGlobal.cptetoile =3
	
###############################################
#Dialog on main zone
#############################################

func _on_caramelBoss_body_entered(body):
	if body.is_in_group("Players"):
		#print("entered")
		MainGlobal.DialogZone =true
		MainGlobal.playButtonA = true
	
		$Player2/AnalogButton._animPlayA()


func _on_caramelBoss_body_exited(body):
	MainGlobal.DialogZone = false
	MainGlobal.playButtonA = false
	$HUD/DialogCaramel.hide()
	$Player2/AnalogButton._animPlayA()

func _on_Player2_pushed():
	#print(MainGlobal.DialogZone)
	if MainGlobal.DialogZone==true:
		$caramelBoss/KinematicBody2D/caramelBoss_sp/emote_pop.hide()
		$HUD/DialogCaramel.show()
		$HUD/DialogCaramel.loadTextCaramel()
