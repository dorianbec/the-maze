extends "res://engine/itemEntity.gd"

signal hit #le nom du signal doit être un string

#On prepare les variables
onready var effect = get_node("Tweenetoile")
onready var sprite = get_node("etoilepng")

func _ready():
	#Effets de transition de l'objets ".interpolate_property" de 
	#"Tween" prend 7 paramètres
	
	effect.interpolate_property(sprite, 'position', Vector2(0,0), Vector2(0,-31), .7, Tween.TRANS_QUAD,Tween.EASE_OUT)
	#effect.interpolate_property(sprite, 'scale', sprite.get_scale(), Vector2(.3,.3), .9,Tween.TRANS_QUAD, Tween.EASE_OUT)
	effect.interpolate_property(sprite, 'modulate', Color(1,1,1,1), Color(1,1,1,1), .7, Tween.TRANS_QUAD, Tween.EASE_OUT)

var cptetoiletemp = 0
func _on_etoile_body_entered(body):
	if body.is_in_group("Players"):
		if cptetoiletemp == 0:
			#On emmet le signal lorsque le block de collision est touché
			
			emit_signal("hit")
			cptetoiletemp +=1
			#On lance l'effet de transition qu'on a créé plus haut
			effect.start()
		

func _on_Tweenetoile_tween_completed(object, key):
	#On libère l'objet de la mémoire
	queue_free()
