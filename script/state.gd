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

func new_entity() -> String:
	var id = Uuid.v4()
	entity[id] = {}
	new_uuid(id, id)
	new_creation_time(id)
	#print("Created new entity ", Uuid.short(id))
	return id

func new_component(parent_entity: String, type: String, data: Dictionary) -> String:
	return _attach(type, parent_entity, data)

func new_uuid(parent_entity: String, uuid: String) -> String:
	var new_comp = {}
	new_comp["value"] = uuid
	return _attach("uuid", parent_entity, new_comp)

func new_terminal(parent_entity: String) -> String:
	var new_comp = {}
	return _attach("terminal", parent_entity, new_comp)

func new_position(parent_entity: String) -> String:
	var new_comp = {}
	return _attach("position", parent_entity, new_comp)

func new_clock(parent_entity: String) -> String:
	var new_comp = {}
	return _attach("clock", parent_entity, new_comp)

func new_universe(parent_entity: String) -> String:
	var new_comp = {}
	return _attach("universe", parent_entity, new_comp)

func new_planet(parent_entity: String) -> String:
	var new_comp = {}
	return _attach("planet", parent_entity, new_comp)

func new_creation_time(parent_entity: String) -> String:
	var new_comp = {}
	new_comp["time"] = Time.get_datetime_dict_from_system(true)
	return _attach("creation time", parent_entity, new_comp)
