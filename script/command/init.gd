class_name Init

static func run(state: State):
	print("Setting up systems...");
	var xr_system = NewEntity.run(state)
	var xr = Xr.new(state)
	Attach.run(state, xr_system, System.gen(xr))
	InitXr.run(state)
	
	state.get_viewport().use_xr = true

	print("Setting up uplink terminal...");
	var terminal = NewEntity.run(state)
	Attach.run(state, terminal, Terminal.gen())
	Attach.run(state, terminal, Position.gen(Vector3.ZERO))
	Attach.run(state, terminal, Clock.gen())
	
	print("Initializing default computer...");

	var user = NewEntity.run(state);
	Attach.run(state, user, Position.gen(Vector3.ZERO))
	Attach.run(state, user, User.gen())
	Attach.run(state, user, Avatar.gen())

	print("Initializing default environment...");

	var universe = NewEntity.run(state);
	Attach.run(state, universe, Position.gen(Vector3.ZERO))
	Attach.run(state, universe, Universe.gen())

	var planet = NewEntity.run(state);
	Attach.run(state, planet, Position.gen(Vector3.ZERO))
	Attach.run(state, planet, Planet.gen())

	var chunk = NewEntity.run(state);
	Attach.run(state, chunk, Position.gen(Vector3.ZERO))

	var chunk_hoster = NewEntity.run(state);
	Attach.run(state, chunk_hoster, Position.gen(Vector3.ZERO))
	
	Status.run(state)
