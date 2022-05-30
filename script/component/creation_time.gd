extends Object

class_name CreationTime

static func gen() -> Dictionary:
	var new_comp = {}
	new_comp["type"] = "creation time"
	new_comp["time"] = Time.get_datetime_dict_from_system(true)
	return new_comp
