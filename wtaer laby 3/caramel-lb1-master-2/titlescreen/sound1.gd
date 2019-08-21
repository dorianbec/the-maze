extends Sprite

func _ready():
	if MainGlobal.boolsound1==true:
		set_texture(MainGlobal.texture1)
	else:
		set_texture(MainGlobal.texture2)
	
	

func _on_Buttonsound1_pressed():
	_loadSoundIcon()

func _loadSoundIcon():
	MainGlobal.boolsound1 = !MainGlobal.boolsound1
	
	if MainGlobal.boolsound1:
		set_texture(MainGlobal.texture1)
		
		#print("opened")
	else:
		set_texture(MainGlobal.texture2)
		
		#print("closed")
	
