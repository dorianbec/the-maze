extends "res://engine/entity.gd"


#const SPEED = 40

#le code ci-dessous va lancer une boucle pour faire deplacer le mob 
#un certain nombre de pas, puis va lui faire changer de direction

var movetimer_length = 15
var movetimer = 0

func _ready():
	$anim.play("default")
	movedir = dir.rand()
	
func _physics_process(delta):
	movement_loop()
	if movetimer > 0:
		movetimer -= 1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_length
	