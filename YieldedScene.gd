extends Node

# var MainMenu = load(ProjMenu)
var MainMenu = load("res://test-menu.tscn")
# second step - keep loaded and ready to instance later
# especially if need to instantiate many at once
export(PackedScene) var scn = MainMenu.instance()
func _ready():
	# load scene after two seconds
	yield(get_tree().create_timer(2.0), "timeout")
	# add scene, as if it were an overlay
	self.add_child(scn)
	$Timer.connect("timeout", self, "on_Timer_timeout")
	move_child(scn, 0)

# this should run every second?
func _on_Timer_timeout():
	# print("Time out!")
	# $Sprite.visible = !$Sprite.visible 
	pass # Replace with function body.
