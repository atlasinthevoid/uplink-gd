extends Node

var state

# Called when the node enters the scene tree for the first time.
func _ready():
	state = get_node("State")
	print("Atlas' Uplink System Core")
	init()

func init():
	print("Setting up xr...");
	get_viewport().use_xr = true

	print("Setting up uplink terminal...");
	var terminal = state.new_entity()
	state.new_terminal(terminal)
	state.new_position(terminal)
	state.new_clock(terminal)
	
	print("Initializing default computer...");

	var user = state.new_entity();
	state.new_position(user)

	print("Initializing default environment...");

	var universe = state.new_entity();
	state.new_position(universe)
	state.new_universe(universe)

	var planet = state.new_entity();
	state.new_position(planet)
	state.new_planet(planet)

	var chunk = state.new_entity();
	state.new_position(chunk)

	var chunk_hoster = state.new_entity();
	state.new_position(chunk_hoster)
	
	state.command.emit_signal("status")

	init_env()

func init_env():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for system in state.system:
		pass
