extends Node
class_name MirrorCamera

func _init(state: State):
	state.add_child(self)

# https://github.com/19PHOBOSS98/Godot-MirrorInstance
func _ready():
	pass

func _process(delta):
	var state: State = get_parent()
	for component in state.component_by_type["mirror"]:
		pass
