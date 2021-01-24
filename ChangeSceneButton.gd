extends Button
onready var text_box = get_node("../LineEdit")
var user_scene : String
signal scene_chosen(_scene)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(text_box.text)
	pass # Replace with function body.


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



func _on_LineEdit_text_change_rejected():
	print("Sorry, can't change to " + user_scene)


func _on_LineEdit_focus_entered():
	text_box.text = ""
	pass # Replace with function body.
