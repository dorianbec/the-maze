extends CanvasLayer

signal pushA

func _ready():
	_animPlayA()
#	$ButtonA.set_texture(MainGlobal.buttonStateDefault)
#	$circleA.hide()
	pass
#func _process(delta):
#	pass

func _animPlayA():
	if MainGlobal.playButtonA == true :
		$circleA.show()
		$ButtonA.show()
		$ButtonA.set_texture(MainGlobal.buttonStateOn)
		$animButtA.play("animButtA")
	else :
		$ButtonA.hide()
		$circleA.hide()
#		$animButtA.stop()


func _on_Buttonanalog_pressed():
	emit_signal("pushA")
	
