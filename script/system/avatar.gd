extends Node
class_name Avatar

func _init(state: State):
	state.add_child(self)

func _ready():
	pass

func _process(_delta):
	var state: State = get_parent()
	for component in WithName.run(state, "avatar"):
		var entity: String = state.component[component].entity
		if !state.entity[entity].has("origin"):
			pass
			#Log.run(state, "Found empty avatar")
