extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".texture = MainGlobal.charSelected
	
	#set_texture(MainGlobal.charSelected)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Buttonchar1_pressed():
	MainGlobal.charSelected = MainGlobal.textureChoice2
	
	print(MainGlobal.charSelected)
	


func _on_Buttonchar2_pressed():
	MainGlobal.charSelected = MainGlobal.textureChoice1
	