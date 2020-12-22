extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a = null
var myArray = Array()
# Called when tree loaded in - called in after parent's own _enter_tree()
func _enter_tree():
	print("SceneOne has been loaded successfully.")

# Called when the node enters the scene tree for the first time. Called after _enter_tree(); only called when children ready.
func _ready():
	for i in range(0,10,1):
		myArray.append(i)
		print(10-i)
	print(self.get_node(".").name)
	pass # Replace with function body.

#func _input():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
