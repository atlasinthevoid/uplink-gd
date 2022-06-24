extends Node
class_name Xr

func _init(state: State):
	state.add_child(self)

func _ready():
	pass

func _process(_delta):
	var state: State = get_parent()
	for component in WithName.run(state, "xr"):
		var entity: String = state.component[component].entity
		if !state.entity[entity].has("origin"):
			var origin := XROrigin3D.new()
			state.add_child(origin)
			
			var camera := XRCamera3D.new()
			origin.add_child(camera)
			
			var left_controller := XRController3D.new()
			left_controller.tracker = "left_hand"
			origin.add_child(left_controller)
			
			var cube := MeshInstance3D.new();
			cube.mesh = BoxMesh.new()
			cube.scale = Vector3(0.25, 0.25, 0.25)
			left_controller.add_child(cube)
			
			var right_controller := XRController3D.new()
			left_controller.tracker = "right_hand"
			origin.add_child(right_controller)
			
			Attach.run(state, entity, "origin", "xr origin 3d", origin)
