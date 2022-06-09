class_name Attach

static func run(state: State, parent_entity: String, new_comp: Dictionary) -> String:
	new_comp["id"] = Uuid.v4()
	new_comp["creation time"] = Time.get_datetime_dict_from_system(true)
	new_comp["entity"] = parent_entity
	
	state.component[new_comp.id] = new_comp
	if !state.component_by_type.has(new_comp.type):
		state.component_by_type[new_comp.type] = []
	state.component_by_type[new_comp.type].append(new_comp.id)
	
	if !state.entity[new_comp.entity].has(new_comp.type):
		state.entity[new_comp.entity][new_comp.type] = []
	state.entity[new_comp.entity][new_comp.type].append(new_comp.id)
	if new_comp.type != "uuid" and new_comp.type != "position" and new_comp.type != "creation time":
		print("Attached ", new_comp.type, " to ", Uuid.short(parent_entity))
	return new_comp.id

static func undo(state: State):
	pass
