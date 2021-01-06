extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(self.position)
	# position sprite to centre of viewport:
	position=Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	scale = Vector2(0.3, 0.3)
	# rotate, default radians
	rotate(deg2rad(90))
	set_process(true)
func _process(delta):
	# spin the sprite round and round
	#rotate(deg2rad(90*delta))
	rotation = self.rotation + deg2rad(90*delta)
	translate(Vector2(-100 * delta, 0))

	if (position.x < 0):
		position = Vector2(get_viewport().size.x, get_viewport().size.y/2)
	elif (position.x > get_viewport().size.x):
		pass
	#pass
