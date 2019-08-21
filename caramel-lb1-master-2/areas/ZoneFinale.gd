extends "res://engine/MainG.gd"

var selectedScene 

func _ready():
	#Garde la valeur entre les scenes au sinon reset 
	$HUD.update_baguette(MainGlobal.cptbag) 
	$HUD.update_codex(MainGlobal.cptcodex) 
	$HUD.update_etoile(MainGlobal.cptetoile) 
	#print(MainGlobal.DialogZone)
	
#func _input(event):
#	if Input.is_action_pressed("ui_up"):
#		print("action to do")

#func _on_baguette2_hit():
#	MainGlobal.cptbag +=1
#	$HUD.update_baguette(MainGlobal.cptbag)
#	#$HUD/GUI.updatetest(cptbag)

func _on_finalBoss_body_entered(body):
	if body.is_in_group("Players"):
		#print("entered")
		MainGlobal.DialogZone =true
		MainGlobal.playButtonA = true
	
		$Player2/AnalogButton._animPlayA()
	
func _on_finalBoss_body_exited(body):
	MainGlobal.DialogZone = false
	MainGlobal.playButtonA = false
	$HUD/DialogBox.hide()
	$Player2/AnalogButton._animPlayA()

func _on_Player2_pushed():
	#print(MainGlobal.DialogZone)
	if MainGlobal.DialogZone==true:
		$finalBoss/KinematicBody2D/finalBoss1/emote_excla1.hide()
		$HUD/DialogBox.show()
		$HUD/DialogBox.loadTextFinal()

