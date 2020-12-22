extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Variables with script-wide scope
var pi = PI
#export(Node) var a = Spatial.new()
#export(Node) var child_node = Node.new().instance()
#var b = int(3)
var scn = load("res://Child.gd");var sn = scn.instance();
export var coords = Vector2(3,2)
export(float) var aoe_radius = 8
var aoe = pow(aoe_radius, 2) * pi
var s_coords = "Current location: " + String(coords)
var myArray = Array()
# Called when tree loaded in - called in after parent's own _enter_tree()
func _enter_tree():
	print("SceneOne has been loaded successfully.")

# Called when the node enters the scene tree for the first time. Called after _enter_tree(); only called when children ready.
func _ready():
	add_child(sn)
	for i in range(0,10,1):
		myArray.append(i)
		print(10-i)
	print(self.get_node(".").name)
	print(s_coords)
	print("Your area of influence is " + String(aoe) + " units.")
	pass # Replace with function body.
	

#func _input():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
