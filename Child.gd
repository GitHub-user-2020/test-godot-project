extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
"""
var parentName
var p1
var p2
var p3

# Called when the node enters the scene tree for the first time.
func _ready():
	#parentName = get_parent().get_parent().name
	
	# terminal style relative node reference
	parentName = get_node("./../..").name
	print(self.get_node("./..").get_child_count())
	
	# go from top
	parentName = get_tree().get_root().get_node("TheRoot").get_child(0).get_child(0).name
	
	print("My grandparent is " + parentName)
	
	# attempt to infer types
	p1 = get_tree()
	p2 = get_tree().get_root()
	p3 = get_tree().get_root().get_node("TheRoot")
	
	print(str(typeof(get_tree())) + str(p1)) # SceneTree
	print(str(typeof(get_tree().get_root())) + str(p2)) # Viewport
	print(str(typeof(get_tree().get_root().get_node("TheRoot"))) + str(p3)) #node
	print(typeof(parentName)) # string
	
	print(find_node("Child2",true,false))
	print(get_node("./..").get_children()[1].name + " found!")
"""