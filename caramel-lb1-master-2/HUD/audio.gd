extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	if MainGlobal.boolsound1==true:
		set_texture(MainGlobal.sound1HUD)
	else:
		set_texture(MainGlobal.sound2HUD)
	
	
func _on_Buttonaudio_pressed():
	_loadSoundIcon2()

func _loadSoundIcon2():
	
	
	if MainGlobal.boolsound1==false:
		set_texture(MainGlobal.sound1HUD)
		MainGlobal.boolsound1 = true
		#print("opened")
	else:
		set_texture(MainGlobal.sound2HUD)
		MainGlobal.boolsound1 = false
		#print("closed")
		
	