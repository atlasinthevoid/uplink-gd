class_name Status

static func run(state: State):
	AddHistory.run(state, "status")
	print("State contains: ")
	#print("  ", " ticks", )
	print("  ", state.entity.size(), " entities", )
	print("  ", state.component.size(), " components")
	print("  ", state.component_by_type.size(), " types")
	print("  ", state.history.size(), " changes")

static func undo(state: State):
	pass
