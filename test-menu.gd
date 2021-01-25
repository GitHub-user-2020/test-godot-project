extends Panel
var csb # change scene button reference
		# emit signal to one of its variables
		# to trigger a function for it

var _ns # placeholder variable so changing scene works
var _btn # placeholder variable for initial button
var NewBtn

func _ready():
	get_node("VBoxContainer").add_to_group("menu")
	print("Objects within group \"menu\":")

	for obj in get_child(0).get_children():
		obj.add_to_group("menu")
		print(obj.name)
	print(get_tree().get_nodes_in_group("menu"))

	_btn = get_node("VBoxContainer/Button")
	_btn.connect("pressed", self, "_on_Button_pressed")
	#set_process(false)

	csb = get_node("VBoxContainer/ChangeSceneButton")
	csb.connect("scene_chosen", self, "open_chosen_scene")
	NewBtn = Button.new() 	# create new node (different from instantiating scene)
											# opposite of this is .free() - use queue_free() in case it's still running
											# a function or emitting a signal.
	NewBtn.name = "New Button"
	get_node("VBoxContainer").add_child(NewBtn) # add new node to tree as child of existing node

func _process(_delta):
	pass

# consider adding input logic in order to allow menu navigation
# with gamepad or keyboard
func _on_Button_pressed():
	get_node("VBoxContainer/Label").text = "Sebastian Vettel is complaining about blue flags"

# function that actually changes scene. Depends on:
# - Signal from ChangeSceneButton.gd being emitted
# - Signal from a text box being emitted, from within
# aforementioned script.
func open_chosen_scene(scene_name : String):
	scene_name = scene_name + ".tscn"
	print("Attempting to open " + scene_name + "...")
	_ns = get_tree().change_scene(scene_name)
	pass

# alternative to pressing Return key to change scene
func _on_ChangeSceneButton_pressed():
	print("Changing scene through mouse click...")
	# on ChangeSceneButton.gd, emit signal that triggers _on_LineEdit_text_changed() function
	# this in turn should trigger open_chosen_scene()
	csb.text_box.emit_signal("text_entered", csb.user_scene)
	print("Opening " + csb.user_scene)
	# ISSUES:
	# - Try opening "testscene" without the quotes, and then "SceneOne" in the text box and 
	# 	click the change scene button.
