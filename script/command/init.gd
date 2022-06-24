class_name Init

static func run(state: State):
	print("Setting up systems...");
	var xr_system = NewEntity.run(state)
	Attach.run(state, xr_system, "xr", "system", Xr.new(state))
	InitXr.run(state)
	
	var avatar_system = NewEntity.run(state)
	Attach.run(state, avatar_system, "avatar", "system", Avatar.new(state))
	
	var file_system = NewEntity.run(state)
	Attach.run(state, file_system, "file manager", "system", FileManager.new(state))
	
	
	state.get_viewport().use_xr = true

	print("Setting up uplink terminal...");
	var terminal = NewEntity.run(state)
	Attach.run(state, terminal, "terminal", "bool", false)
	Attach.run(state, terminal, "position", "vector 3", Vector3.ZERO)
	Attach.run(state, terminal, "clock", "bool", false)
	
	print("Initializing default computer...");

	var user = NewEntity.run(state);
	Attach.run(state, user, "position", "vector 3", Vector3.ZERO)
	Attach.run(state, user, "user", "bool", false)
	Attach.run(state, user, "avatar", "bool", false)

	print("Initializing default environment...");

	var universe = NewEntity.run(state);
	Attach.run(state, universe, "position", "vector 3", Vector3.ZERO)
	Attach.run(state, universe, "universe", "bool", false)

	var planet = NewEntity.run(state);
	Attach.run(state, planet, "position", "vector 3", Vector3.ZERO)
	Attach.run(state, planet, "planet", "bool", false)

	var chunk = NewEntity.run(state);
	Attach.run(state, chunk, "position", "vector 3", Vector3.ZERO)

	var chunk_hoster = NewEntity.run(state);
	Attach.run(state, chunk_hoster, "position", "vector 3", Vector3.ZERO)
	
	Status.run(state)
