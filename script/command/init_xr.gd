class_name InitXr

static func run(state: State):
	var origin = NewEntity.run(state)
	Attach.run(state, origin, "xr", "bool", false)
