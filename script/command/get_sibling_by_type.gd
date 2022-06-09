class_name GetSiblingByType

func run(state: State, child_component: String, type: String) -> String:
	var component_list = state.entity[state.component[child_component].entity]
	return component_list[type]

static func undo(state: State):
	pass
