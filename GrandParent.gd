extends Node

var sp
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _newScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# _newScene = get_tree().change_scene("test-menu.tscn")
	#print(get_child(0).get_child(1).name)
	#print(find_node("Child", true, false))
	sp = get_tree().get_root().get_node("TheRoot").get_child(1)
	print(sp.name)
	sp.connect("off_screen", self, "notify_edge_screen")
	pass # Replace with function body.


func notify_edge_screen(node_name):
	print("Sprite " + node_name + " off screen!")
	# node_name.position = node_name
	print("Sprite " + node_name + " teleported to a different position!")
	pass
	# switching between scenes
	#print("Changing the current scene to \"SceneOne.tscn\"...")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		$"/root/Globals".open_main_menu()
#	pass
