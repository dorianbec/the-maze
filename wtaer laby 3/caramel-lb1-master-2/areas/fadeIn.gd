extends ColorRect

signal fadeIn_finished

func fade_in():
	$entree.play("fonduEntree")

func _on_entree_animation_finished(anim_name):
	emit_signal("fadeIn_finished")
