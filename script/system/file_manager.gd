extends Node
class_name FileManager

func _init(state: State):
	state.add_child(self)

func _ready():
	var state: State = get_parent()
	var usr = OS.get_user_data_dir().split("/")
	var home = usr[0] + "/" + usr[1] + "/" + usr[2]
	
	Attach.run(state, NewEntity.run(state), "string", "home directory", home)
	
	Attach.run(state, NewEntity.run(state), "desktop directory", "string", OS.get_system_dir(OS.SystemDir.SYSTEM_DIR_DESKTOP))
	Attach.run(state, NewEntity.run(state), "documents directory", "string", OS.get_system_dir(OS.SystemDir.SYSTEM_DIR_DOCUMENTS))
	Attach.run(state, NewEntity.run(state), "downloads directory", "string", OS.get_system_dir(OS.SystemDir.SYSTEM_DIR_DOWNLOADS))
	Attach.run(state, NewEntity.run(state), "music directory", "string", OS.get_system_dir(OS.SystemDir.SYSTEM_DIR_MUSIC))
	Attach.run(state, NewEntity.run(state), "pictures directory", "string", OS.get_system_dir(OS.SystemDir.SYSTEM_DIR_PICTURES))
	
	Log.run(state, "Scanning documents...")
	ScanDir.run(state, state.component[WithName.run(state, "documents directory")[0]].value)

func _process(_delta):
	var state: State = get_parent()
	for component in WithName.run(state, "file"):
		var entity: String = state.component[component].entity
		if !state.entity[entity].has("origin"):
			pass
