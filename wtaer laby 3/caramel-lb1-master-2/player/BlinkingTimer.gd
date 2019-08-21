extends Timer

var blinking = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func blink():
	if blinking == true:
		
		$".".visible = !$".".visible
		$BlinkingTimer/Timer.start()
	else :
		$".".visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
