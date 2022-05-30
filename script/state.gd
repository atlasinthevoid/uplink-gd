extends Node

class_name State

var entity = {}
var component = {}
var component_by_type = {}
var history = []
var debug_log = []
var system = {}
var command

func _ready() -> void:
	command = CommandStore.new(self)

func _attach(type: String, parent_entity: String, new_comp: Dictionary) -> String:
	new_comp["id"] = Uuid.v4()
	new_comp["creation time"] = Time.get_datetime_dict_from_system(true)
	new_comp["entity"] = parent_entity
	new_comp["type"] = type
	
	component[new_comp.id] = new_comp
	if !component_by_type.has(new_comp.type):
		component_by_type[new_comp.type] = []
	component_by_type[new_comp.type].append(new_comp.id)
	
	var component_list = entity[new_comp.entity]
	if !component_list.has(new_comp.type):
		component_list[new_comp.type] = []
	component_list[new_comp.type].append(new_comp.id)
	if type != "uuid" and type != "position" and type != "creation time":
		print("Attached ", type, " to ", Uuid.short(parent_entity))
	return new_comp.id

func get_sibling_by_type(child_component: String, type: String) -> String:
	var component_list = entity[component[child_component].entity]
	return component_list[type]

func new_entity() -> String:
	var id = Uuid.v4()
	entity[id] = {}
	attach(id, Uuid.gen(id))
	attach(id, CreationTime.gen())
	#print("Created new entity ", Uuid.short(id))
	return id

func attach(parent_entity: String, data: Dictionary) -> String:
	return _attach(data.type, parent_entity, data)
