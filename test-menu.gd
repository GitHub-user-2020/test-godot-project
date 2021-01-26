extends Panel
class_name ProjMenu # class name, so editor sees this as a custom type
var csb # change scene button reference
		# emit signal to one of its variables
		# to trigger a function for it
var _ns # placeholder variable so changing scene works
var _btn # placeholder variable for initial button
var CreditsBtn # Button to show credits and licenses
var ExitBtn # Button to quit application
var TitleLabel
var VertCtnr # container for buttons
func _ready():
	VertCtnr = get_node("VBoxContainer")
	# align container to be at the centre of the screen
	VertCtnr.set_alignment(1)
	VertCtnr = get_child(0)
	VertCtnr.add_to_group("menu")
	TitleLabel = VertCtnr.get_node("Label")
	TitleLabel.name = "Main Menu"
	TitleLabel.text = "Main Menu"
	print("Objects within group \"menu\":")
	# VertCtnr.move_child(TitleLabel, 2) 
	for obj in get_child(0).get_children():
		obj.add_to_group("menu")
		print(obj.name)
	print(get_tree().get_nodes_in_group("menu"))

	_btn = VertCtnr.get_node("Button")
	# _btn.connect("pressed", self, "_on_Button_pressed")
	_btn.queue_free()
	#set_process(false)

	csb = VertCtnr.get_node("ChangeSceneButton")
	csb.connect("scene_chosen", self, "open_chosen_scene")
	# NewBtn = Button.new() 	# create new node (different from instantiating scene)
	# 										# opposite of this is .free() - use queue_free() in case it's still running
	# 										# a function or emitting a signal.
	# NewBtn.name = "New Button"
	# get_node("VBoxContainer").add_child(NewBtn) # add new node to tree as child of existing node
	CreditsBtn = Button.new()
	ExitBtn = Button.new()
	CreditsBtn.name = "Credits and licenses"
	CreditsBtn.text = "Credits and licenses"
	ExitBtn.name = "Exit"
	ExitBtn.text = "Exit"
	VertCtnr.add_child(CreditsBtn)
	VertCtnr.add_child(ExitBtn)
	ExitBtn.connect("pressed", self, "_on_ExitBtn_pressed")
	# add toggle for Credits and licenses button to expand/hide
	# wall of text
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
func _on_ExitBtn_pressed():
	get_tree().quit(0)
