class_name ScanDir

static func run(state: State, path: String, i:= ""):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print(i + file_name)
				ScanDir.run(state, path + "/" + file_name, i + "    ")
			else:
				print(i + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")

static func undo(_state: State):
	pass
