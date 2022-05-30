

class_name CommandStore

var state

signal status
signal increment
signal get_position
signal get_chunk_position

func _init(new_state):
	state = new_state
	status.connect(_on_status)

func _on_status():
	print("State contains: ")
	#print("  ", " ticks", )
	print("  ", state.entity.size(), " entities", )
	print("  ", state.component.size(), " components")
	print("  ", state.component_by_type.size(), " types")
	print("  ", state.history.size(), " changes")
