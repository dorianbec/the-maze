extends Control
var toSC2 = load("res://titlescreen/RulesScreen2.tscn")

func _ready():
	pass # Replace with function body.

func _on_ReturnButton_pressed():
	get_tree().change_scene_to(MainGlobal.menuTitle)


func _on_ReturnButton2_pressed():
	get_tree().change_scene_to(toSC2)
