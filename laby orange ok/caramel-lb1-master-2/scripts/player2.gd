
extends "res://engine/entity.gd"

signal pushed
const MAX_ZOOM = Vector2(0.6,0.6)
const MIN_ZOOM = Vector2(1,1)

#export (int) var SPEED
#var velocity
var screensize
var screenHeight = ProjectSettings.get_setting("display/window/size/height")
var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var movement = Vector2(0,0)

func _init():
	TYPE = "PLAYER"
	#SPEED = 30

func _ready():
	screensize = get_viewport_rect().size
	#Pour connecter et recevoir le signal de controlSlimes:
	$"../controlSlimes".connect("touchedFromControl", self, "onTouched")
	
	
func move_player_virtual_stick(delta):
	movement_loop()
	spritedir_loop()
	knockback_loop()
	
	#On arrondit les valeurs x, y pour avoir des valeurs nets pour 
	#les directions du personnage
	var x = round($Analog.stick_vector[0])
	var y = round($Analog.stick_vector[1])
	#print(x)
	#print(y)
	#On place le vector converti dans une variable:
	var vectorConverti = Vector2(x,y)
	
	#On le place dans la var "movedir" déclaré dans "entity.gd"
	movedir = vectorConverti
	position += vectorConverti * $Analog.stick_speed * 1 * delta
	
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else : 
		anim_switch("idle")
		
func _process(delta):
	move_player_virtual_stick(delta)

#func _physics_process(delta):
#	controls_loop()
#	movement_loop()
	#spritedir_loop()
#
#	if is_on_wall():
#		if spritedir == "left" and test_move(transform, Vector2(-1,0)):
#			anim_switch("push")
#		if spritedir == "right" and test_move(transform, Vector2(1,0)):
#			anim_switch("push")
#		if spritedir == "up" and test_move(transform, Vector2(0,-1)):
#			anim_switch("push")
#		if spritedir == "down" and test_move(transform, Vector2(0,1)):
#			anim_switch("push")
#	if movedir != Vector2(0,0):
#		anim_switch("walk")
#	else : 
#		anim_switch("idle")

#func controls_loop():
#	#control directionnel pour clavier
#	var LEFT	= Input.is_action_pressed("ui_left")
#	var RIGHT	= Input.is_action_pressed("ui_right")
#	var UP		= Input.is_action_pressed("ui_up")
#	var DOWN	= Input.is_action_pressed("ui_down")
#
#	movedir.x= -int(LEFT) + int(RIGHT)
#	movedir.y = -int(UP) + int(DOWN)
#
#	if movedir != Vector2(0,0):
#		anim_switch("walk")
#	else : 
#		anim_switch("idle")

#Bouton qui envoie le signal pour dialoguer
func _on_AnalogButton_pushA():
	emit_signal("pushed")

#Faire clignoter le joueur lorsqu'il se prend un ennemi
var blinking = false
func onTouched():
	#print("lol2")
	print(MainGlobal.cptetoile)
	if MainGlobal.cptetoile >= 1:
		MainGlobal.cptetoile -=1
		$"../HUD".update_etoile(MainGlobal.cptetoile)
		$etoileTouch.playTheTouchEffect() #effet etoile retrait
		blinking = true
		#print("start")
		#creer un timer de 1 sec pdt laquelle on execute l'autre timer
		yield(get_tree().create_timer(.3), "timeout")
		blinking = false #remettre le perso en état visible après timer
		#print("end")
		
		#print(blinking)
		if MainGlobal.cptetoile <= 0:
			get_tree().change_scene_to(MainGlobal.loseScene)
			#print("YOU LOSE!")

func _on_BlinkingTimer_timeout():
	if blinking == true:
		$".".visible  = !$".".visible
	else :
		$".".set_visible(true)
	
