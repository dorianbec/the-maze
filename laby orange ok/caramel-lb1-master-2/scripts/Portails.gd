extends Area2D


export(String, FILE, "*.tscn") var world_scene



func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	if (MainGlobal.cptbag != 0) and (MainGlobal.cptcodex !=0): 
		$CollisionShape2D.set_disabled(false)
		$"Position2D/portail-couche1".show()
		
	else:
		$CollisionShape2D.set_disabled(true)
		$"Position2D/portail-couche1".hide()
		
	for body in bodies:
		if body.is_in_group("Players"):  #old--> if body.name == "Player2": 
			get_tree().change_scene(world_scene)
			print(bodies)



