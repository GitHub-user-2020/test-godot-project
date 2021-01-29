extends Node
# Go to project settings > AutoLoad

export var answer_of_life = 42
export var is_menu_visible = false
var MainMenu = preload("res://test-menu.tscn")
export(PackedScene) var mm = MainMenu.instance()
var mm_pos

func reset_global_vars():
	is_menu_visible = false

# Source: https://godotengine.org/qa/25126/how-to-get-root-node-of-a-scene-not-of-whole-tree
func open_main_menu():
	print(get_tree().get_current_scene().name)
	mm_pos = get_tree().get_current_scene()
	mm_pos.add_child(mm)
	# move_child(mm, 0)
	# mm_pos.move_child(0)
