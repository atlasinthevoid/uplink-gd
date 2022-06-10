class_name Position

static func gen(position: Vector3) -> Dictionary:
	var new_comp = {}
	new_comp["type"] = "position"
	new_comp["value"] = position
	return new_comp
