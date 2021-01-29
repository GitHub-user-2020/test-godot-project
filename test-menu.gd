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
var ContinueButton # continue button
func _ready():
	self.name = "Main Menu panel"
	VertCtnr = get_node("VBoxContainer")
	# align container to be at the centre of the screen
	VertCtnr.set_alignment(1)
	VertCtnr = get_child(0)
	VertCtnr.add_to_group("menu")
	TitleLabel = VertCtnr.get_node("Label")
	TitleLabel.name = "Main Menu title"
	TitleLabel.text = "Main Menu"
	print("Objects within group \"menu\":")
	# VertCtnr.move_child(TitleLabel, 2) 
	for obj in get_child(0).get_children():
		obj.add_to_group("menu")
		print(obj.name)
	print(get_tree().get_nodes_in_group("menu"))

	# exercise in deleting nodes
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
	ContinueButton = Button.new()

	CreditsBtn.name = "Credits and licenses"
	CreditsBtn.text = "Credits and licenses"
	ContinueButton.name = "Continue button"
	ContinueButton.text = "Continue"

	ExitBtn.name = "Exit"
	ExitBtn.text = "Exit"

	# use is_action_just_pressed to execute once per frame only.
	if get_tree().get_current_scene().name != "Main Menu panel":
		VertCtnr.add_child(ContinueButton)
		# attempt to move continue buttonn to the top of the container,
		# only below label.
		move_child(ContinueButton, 0)
		ContinueButton.connect("pressed", self, "_on_ContinueButton_pressed")

	VertCtnr.add_child(CreditsBtn)
	VertCtnr.add_child(ExitBtn)
	ExitBtn.connect("pressed", self, "_on_ExitBtn_pressed")
	# add toggle for Credits and licenses button to expand/hide
	# wall of text

	# $"/root/Globals".is_menu_visible = true
	print(get_tree().get_current_scene().name)
func _process(_delta):
	# define global variable - will be useful for
	# pause functionality for instance
	if self.visible:
		# $"/root/Globals".is_menu_visible = true
		$"/root/Globals".is_menu_visible = true
		pass
	else:
		# $"root/Globals".is_menu_visible = false
		pass
		# $"/root/Globals".is_menu_visible = false
	# grab focus on change scene button
	# if no focus is present
	if Input.is_key_pressed(KEY_TAB):
		# print("TAB pressed, selecting a button")
		if csb.get_focus_owner() == null:
			csb.text_box.grab_focus()

	# use is_action_just_pressed to execute once per frame only.
	if Input.is_action_just_pressed("ui_cancel") && $"/root/Globals".is_menu_visible && get_tree().get_current_scene().name != "Main Menu panel":
		if ContinueButton.get_focus_owner() == null:
			ContinueButton.grab_focus()
			ContinueButton.emit_signal("pressed")
		# call("defocus")
		# emit_signal("hide")
		# $"root/Globals".is_menu_visible = false
		pass

func _on_ContinueButton_pressed():
	call("defocus")
	emit_signal("hide")
# function that actually changes scene. Depends on:
# - Signal from ChangeSceneButton.gd being emitted
# - Signal from a text box being emitted, from within
# aforementioned script.
func defocus():
	print("ESC pressed, removing main menu from viewport in a few seconds")
	# hacky workaround with shared keybind - use yield?
	# remove focus if there is any
	# Source: https://godotforums.org/discussion/22920/how-to-remove-focus-from-control-nodes
	var current_focus_control = get_focus_owner()
	if current_focus_control:
		current_focus_control.release_focus()
	$"/root/Globals".is_menu_visible = false
	self.visible = false
	pass


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