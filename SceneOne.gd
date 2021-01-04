extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Variables with script-wide scope
var pi = PI
#export(Node) var a = Spatial.new()
#export(Node) var child_node = Node.new().instance()
#var b = int(3)

# global variable - use autoloads - separate script.

#var scn = load("res://Child.gd");var sn = scn.instance();
#export var parentNode

export var coords = Vector2(3,2)
export(float) var aoe_radius = 8

# area of effect
var aoe = pow(aoe_radius, 2) * pi
var s_coords = "Current location: " + String(coords)

export var shieldsHealth : float
export var playerHealth : float

# enum
enum FireModes3 {FULL_AUTO, BURST = 3, SEMI_AUTO}

var myArray = Array()
var myDict = {}
var weapons = {
	"UAMk1" : {
		"Caliber" : "7.62x39mm",
		"MagazineSize" : 30,
		"FireModes" : ["Semi", "FullAuto"],
	},
	"CWS94" : {
		"Caliber" : "5.56x45mm",
		"MagazineSize" : 30,
		"FireModes" : ["Semi", "2Burst", "FullAuto"],
	},
	"LA223A1" :  {
		"Caliber" : "5.56x45mm",
		"MagazineSize" : 30,
		"FireModes" : ["Semi", "3Burst", "FullAuto"],
	}
}
# Called when tree loaded in - called in after parent's own _enter_tree()
func _enter_tree():
#	print("SceneOne has been loaded successfully.")
	pass

# Called when the node enters the scene tree for the first time. Called after _enter_tree(); only called when children ready.
func _ready():
	# instantiate child node
	#var child = load("res://Child.gd")
	#var childNode = child.instance()
	#add_child(childNode)

	myDict["First"] = "Second"
	#add_child(sn)
	for i in range(0,10,1):
		myArray.append(i)
		print(10-i)
	print(self.get_node(".").name)

	#print(myDict.First)
	print(myDict["First"])
	print(s_coords)

	# print global variable
	#print(get_node(".").answer_of_life)
	print(get_node("/root/Globals/").answer_of_life)

	print("Your weapon has the following fire modes: " + String(weapons.CWS94.FireModes))
	print("Their weapon has the following fire modes: " + String(weapons["UAMk1"].FireModes))
	print(weapons.get("UAMk1"))
	print("Your area of influence is " + String(aoe) + " units.")

	var _myWeapon = "UAMk1"
	#match Globals # global variables - singleton, so only single instance
	#var myHealth = 200
	shieldsHealth = 100.0
	playerHealth = 100.0
	match playerHealth:
		100.0:
			print("Shields empty")
		200.0:
			print("Shields full")
		75.0:
			print("Health at " + String(playerHealth) + "%; unassisted recovery possible")
		25.0:
			print("Health at " + String(playerHealth) + "%; bleeding out")
		_:
			pass


#match myWeapon:
#		"2Burst" in weapons[myWeapon].FireModes: print("a")
#		_:
	"""
	if "2Burst" in weapons[myWeapon].FireModes:
		print("This gun has a 2-burst fire mode.")
	elif "3Burst" in weapons[myWeapon].FireModes:
		print("This gun has a 3-burst fire mode.")
	else:
		print("This gun does not have a burst fire mode.")
	"""
	pass # Replace with function body.
	

#func _input():
#	pass
func DeductShields(amount : float, shouldDeduct : bool):
	if shieldsHealth > 0 && shouldDeduct:
		shieldsHealth -= amount
	elif shieldsHealth <= 0 && shouldDeduct:
		shieldsHealth -= amount
	else: # do nothing to shield health
		shieldsHealth = shieldsHealth
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# fix code so function is called 
	self.call("DeductShields", delta, true)
	print(shieldsHealth)
	pass
	#._process(delta) # not recommended, extra processing power needed.
					  # demonstrates inheritance
