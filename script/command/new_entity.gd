class_name NewEntity

static func run(state: State) -> String:
	var id = Uuid.v4()
	state.entity[id] = {}
	Attach.run(state, id, Uuid.gen(id))
	Attach.run(state, id, CreationTime.gen())
	#print("Created new entity ", Uuid.short(id))
	return id
