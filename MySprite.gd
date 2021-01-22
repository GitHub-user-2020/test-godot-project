extends Sprite
signal off_screen(node_name)
# Called when the node enters the scene tree for the first time.
func _ready():
	#print(self.position)
	# position sprite to centre of viewport:
	position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	scale = Vector2(0.3, 0.3)

	# rotate, default radians

	# rotate(deg2rad(90))
	set_process(true)
	
func _process(delta):
	# spin the sprite round and round
	#rotate(deg2rad(90*delta))

	yield(get_tree().create_timer(5.0), "timeout")
	rotation = self.rotation + deg2rad(90*delta)
	translate(Vector2(-100 * delta, -100 * delta))
	if (position.x < -1*self.scale.x):
		emit_signal("off_screen", self.name)
		self.position = self.position
		position = Vector2(get_viewport().size.x, get_viewport().size.y)
		print("Moved!")
	elif (position.y < -1*self.scale.y):
		emit_signal("off_screen", self.name)
		self.position = self.position
		position = Vector2(get_viewport().size.x - position.x, get_viewport().size.y)
		print("Moved!")
	elif (position.x > get_viewport().size.x):
		pass
	#pass
