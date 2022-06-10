class_name Attach

static func run(state: State, parent_entity: String, name: String, type: String, value) -> String:
	var component = {}
	component["id"] = Uuid.v4()
	component["creation time"] = Time.get_datetime_dict_from_system(true)
	component["entity"] = parent_entity
	component["name"] = name
	component["type"] = type
	component["value"] = value
	
	state.component[component.id] = component
	if !state.component_by_name.has(name):
		state.component_by_name[name] = []
	state.component_by_name[name].append(component.id)
	
	if !state.entity[parent_entity].has(name):
		state.entity[parent_entity][name] = []
	state.entity[parent_entity][name].append(component.id)
	if name != "uuid" and name != "position" and name != "creation time":
		print("Attached ", name, " to ", Uuid.short(parent_entity))
	return component.id

static func undo(_state: State):
	pass
