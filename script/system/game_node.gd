class_name GameNode

static func gen(node: Node) -> Dictionary:
	var new_comp = {}
	new_comp["type"] = "game node"
	new_comp["node"] = node
	return new_comp
