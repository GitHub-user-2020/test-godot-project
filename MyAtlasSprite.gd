extends Sprite
# below is a "hacky" way to create a sprite atlas animation
# as detailed by gamefromscratch's godot 3.0 tutorial.
var timer

func _ready():
	# create countdown timer
	timer = Timer.new()
	# create a signal without requiring the child node to be present- connect Timer.timeout() to self.tick()
	timer.connect("timeout", self, "tick")
	add_child(timer)
	timer.wait_time = 0.1
	timer.start()

# iterate per each frame
func tick():
	if self.frame < 8:
		self.frame = self.frame+1
	else:
		self.frame = 0
