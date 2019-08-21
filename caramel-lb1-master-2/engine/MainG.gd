extends Node

#Audio section :
var texture1 = load("res://titlescreen/audio1whv1.png")
var texture2 = load("res://titlescreen/audio2whv1.png")

var sound1HUD = load("res://HUD/Asset 43flat_@2x.png")
var sound2HUD = load("res://HUD/customAudioDisabled.png")

var enableAudio = true #mute on/off
var boolsound1 = true #texture switching

#Character selection:
var textureChoice1 = preload("res://player/george.png") #male
var textureChoice2 = preload("res://player/betty-customized-pink.png") #female
var charSelected = textureChoice1 #default

#func changeChar(selection):
#	get_tree("res://player/PLAYERSPRITE").texture = set_texture(charSelected)

#Gamezone:
var menuTitle
var menuRules
var menuCredits
var menuCredits2
var menuSelection
var loseScene
#var world1 = load("res://areas/main.tscn") #in preload at selection screen
var sceneSelected

#Analog Button Texture:
var buttonStateOn = load("res://HUD/ButtflatDark35.png")
#var buttonStateOff = load("res://HUD/ButttransparentDark34.png")

var buttonStateDefault = buttonStateOn
var playButtonA = false

#Dialog section:

var DialogZone = false
#character selection:

#var selectedBoy = true
#var selectedGirl = true
#var charSexSelected = selectedBoy #default

var boolMenuSound = true

var cptcodex = 0
var cptbag = 0
var cptetoile = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	menuTitle = load("res://titlescreen/TitleScreen.tscn")
	menuRules = load("res://titlescreen/RulesScreen.tscn")
	menuCredits = load("res://titlescreen/CreditScreen.tscn")
	menuCredits2 = load("res://titlescreen/CreditScreen2.tscn")
	menuSelection = load("res://titlescreen/SelectionScreen.tscn")
	loseScene = load("res://areas/LoseGame.tscn")
	pass # Replace with function body.

func fonctionFullscreen():
	OS.window_fullscreen = !OS.window_fullscreen

func fonctionResetCpt():
	cptbag =0
	cptcodex =0
	cptetoile =3