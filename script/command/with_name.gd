class_name WithName

static func run(state: State, name: String) -> Array:
	if state.component_by_name.has(name):
		return state.component_by_name[name]
	return []

static func undo(_state: State):
	pass
