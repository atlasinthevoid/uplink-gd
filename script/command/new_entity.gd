class_name NewEntity

static func run(state: State) -> String:
	var id = Uuid.v4()
	state.entity[id] = {}
	Attach.run(state, id, "uuid", "string", id)
	Attach.run(state, id, "creation time", "dictionary", Time.get_datetime_dict_from_system(true))
	#print("Created new entity ", Uuid.short(id))
	return id
