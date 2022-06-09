extends Node

var state = State.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	state = get_node("State")
	Log.run(state, "Atlas' Uplink System Core")
	Init.run(state)
	InitEnv.run(state)
	
	
