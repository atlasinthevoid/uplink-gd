extends Object

class_name GetChunkPosition

func get_chunk_position(state: State, capability: String):
	#var pos = get_sibling_by_type(capability, "position".to_string())
	var pos = Vector3()
	var x = pos.x
	var y = pos.y
	var z = pos.z

	var size: float = 8
	var zero: float = 0
	var chunk_x: float = 0
	var chunk_y: float = 0
	var chunk_z: float = 0
	if x / size > zero:
		chunk_x = (x / size).floor()
	else:
		chunk_x = (x / size).ceil()

	# Fix for negitive 0 (-0.0)
	if chunk_x == zero:
		chunk_x = zero

	if y / size > zero:
		chunk_y = (y / size).floor()
	else:
		chunk_y = (y / size).ceil()

	# Fix for negitive 0 (-0.0)
	if chunk_y == zero:
		chunk_y = zero

	if z / size > zero:
		chunk_z = (z / size).floor()
	else:
		chunk_z = (z / size).ceil()

	# Fix for negitive 0 (-0.0)
	if chunk_z == zero:
		chunk_z = zero

	print("{}, {}, {}", chunk_x, chunk_y, chunk_z)
