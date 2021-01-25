extends Button

onready var text_box = get_node("../LineEdit")	# get text box
var user_scene : String							# name of scene user wants to change to
signal scene_chosen(_scene)						# send signal of chosen scene

# Called when the node enters the scene tree for the first time.
func _ready():
	print(text_box.text)
	pass # Replace with function body.

# for users who prefer to press the Return key to
# confirm their scene change selection.
func _on_LineEdit_text_entered(chosen_scene: String):
	user_scene = chosen_scene
	print("Changing scene through keyboard input...")
	# pass to open_chosen_scene() function in test-menu.gd
	emit_signal("scene_chosen", user_scene)
	pass

# for users who prefer to click the button to change
# scene, this immediately takes the value of the 
# text box and passes it to the button's logic.
func _on_LineEdit_text_changed(new_text):
	user_scene = new_text

# debug invalid scene change
func _on_LineEdit_text_change_rejected():
	print("Sorry, can't change to " + user_scene)

# when text box enters focus
func _on_LineEdit_focus_entered():
	text_box.text = ""

# when text box exits focus, reset text
func _on_LineEdit_focus_exited():
	text_box.text = "Click and type here to choose a scene to open."
