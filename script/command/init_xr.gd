class_name InitXr

static func run(state: State):
	var origin = NewEntity.run(state)
	Attach.run(state, origin, Origin.gen())
