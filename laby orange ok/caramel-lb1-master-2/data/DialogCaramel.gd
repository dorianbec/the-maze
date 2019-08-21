extends CollisionPolygon2D

var text1 = ["Hi!", "My name is Caramel", "I'm the guardian of this place", 
"A portal will appear only if you \n have the required items"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("ui_up") && MainGlobal.DialogZone:
		$".".show()
		loadCaramelDialog()
		
var cpt = 0
func loadCaramelDialog():
	var cptt = 0
	for i in text1: 
		cptt +=1 
		if cpt < cptt:
			$CaramelDialog.set_text(text1[cpt])
			cpt+=1
		elif cpt >=cptt:
			$".".hide()
			cptt = 0
#################
func _on_finalBoss_body_entered(body):
	if body.is_in_group("Players"):
		MainGlobal.DialogZone =true
#		MainGlobal.playButtonA = true

func _on_finalBoss_body_exited(body):
	$".".hide()
	MainGlobal.DialogZone =false
#	MainGlobal.playButtonA = false