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
	state.attach(terminal, Terminal.gen())
	state.attach(terminal, Position.gen(Vector3.ZERO))
	state.attach(terminal, Clock.gen())
	
	print("Initializing default computer...");

	var user = state.new_entity();
	state.attach(user, Position.gen(Vector3.ZERO))
	state.attach(user, User.gen())
	state.attach(user, Avatar.gen())

	print("Initializing default environment...");

	var universe = state.new_entity();
	state.attach(universe, Position.gen(Vector3.ZERO))
	state.attach(universe, Universe.gen())

	var planet = state.new_entity();
	state.attach(planet, Position.gen(Vector3.ZERO))
	state.attach(planet, Planet.gen())

	var chunk = state.new_entity();
	state.attach(chunk, Position.gen(Vector3.ZERO))

	var chunk_hoster = state.new_entity();
	state.attach(chunk_hoster, Position.gen(Vector3.ZERO))
	
	state.command.emit_signal("status")

	init_env()

func init_env():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for system in state.system:
		pass
