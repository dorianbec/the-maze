extends KinematicBody2D

const SPEED =40
var TYPE = "ENNEMY"

var movedir = Vector2(0,0)
var spritedir = "down" #direction de depart du perso
var knockdir = Vector2(0,0)

var hitstun = 0

func movement_loop():
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * SPEED
	else:
		motion = knockdir.normalized() * SPEED * 1.5
	move_and_slide(motion, Vector2(0,0))
	
	#premiere version:
#	var motion = movedir.normalized() * SPEED
#	move_and_slide(motion, Vector2(0,0))
	
func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"

func anim_switch(animation):
	var newanim = str(animation, spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)
		
func knockback_loop():
	pass
#	for body in $hitbox.get_overlapping_bodies():
#
#		if hitstun ==0 and body.get("TYPE") == "PLAYER" :
#			pass
			#print("hey")
			#print(transform)
			#knockdir = position.x - body.position.x
			
			#knockdir = global_transform.origin - (body.global_transform.origin*SPEED)
#			if knockdir != Vector2(0,0):
#				print(knockdir)
			
		

	