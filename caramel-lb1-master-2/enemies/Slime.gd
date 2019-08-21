extends "res://engine/entity.gd"

signal touched
#const SPEED = 40

#le code ci-dessous va lancer une boucle pour faire deplacer le mob 
#un certain nombre de pas(movetimer_length), 
#puis va lui faire changer de direction(movedir = dir.rand())

var movetimer_length = 110
var movetimer = 0
export var speed = .1

var temppos
var tempx
var tempy
func _ready():
	movedir = dir.rand()
	#print(movedir)
	
  
func _physics_process(delta):
	movement_loop() #fonction dans entity
	knockback_loop()
	#print(delta)
	#print(movedir)
#	temppos = $".".get_position()
#	print(temppos)
	if movedir.length() > 0:
		movedir= movedir.normalized() * delta
		#print(movedir)
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	if movedir.x != 0:#+ change la direction du mob en creant l effet miroir
		$AnimatedSprite.flip_h = movedir.x >0
	
		
	if movetimer > 0:
		movetimer -= 1
		
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length
		
func _on_hitbox_body_entered(body):
	if body.is_in_group("Players"):
		emit_signal("touched")
		$".".queue_free()
		#print("touchdown!")
