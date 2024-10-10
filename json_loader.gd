extends Node

#var puzzle_dir = DirAccess.open("res://puzzles")
var puzzle_dir = "res://puzzles"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var dict = {"folder_name":'root', "files":[]}
	#_dir_contents(puzzle_dir, dict)
	#print(dict)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_puzzles(path):
	var dict = {"folder_name":'root', "files":[], "previous_dir":"None"}
	_dir_contents(path, dict)
	return dict

func _dir_contents(path, dict):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var cur_dir = dir.get_current_dir()
			var full_path = cur_dir + '/' + file_name
			if dir.current_is_dir():
				#print(dir.get_current_dir() + '/' + file_name)
				var inner_dict = {"folder_name":file_name, "files":[], "previous_dir":cur_dir}
				print("Found directory: " + full_path)
				_dir_contents(full_path, inner_dict)
				dict['files'].append(inner_dict)
			else:
				print("Found file: " + full_path)
				dict['files'].append(full_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		

func _single_dir_contents(path):
	var list = []
	var dir = DirAccess.open(path)
	var cur_dir = dir.get_current_dir()
	if dir:
		if cur_dir != "res://puzzles" and dir.get_current_dir() != "user://puzzles":
			#dir.include_navigational = true
			list.append({"folder_name":'back', "path":path + '/..', "previous_dir":path})
		if cur_dir == "res://puzzles":
			list.append({"folder_name":'custom', "path":"user://puzzles", "previous_dir":path})
		if cur_dir == "user://puzzles":
			list.append({"folder_name":'back', "path":"res://puzzles", "previous_dir":path})
		var dirs = dir.get_directories()
		var files = dir.get_files()
		
		for dir_name in dirs:
			var full_path = cur_dir + '/' + dir_name
			var inner_dict = {"folder_name":dir_name, "path":full_path, "previous_dir":path}
			list.append(inner_dict)
		for file_name in files:
			var full_path = cur_dir + '/' + file_name
			var inner_dict = {"file_name":file_name, "path":full_path, "previous_dir":path}
			list.append(inner_dict)
		#dir.list_dir_begin()
		#var file_name = dir.get_next()
		##dict["folder_name"] = dir.get_current_dir()
		#while file_name != "":
			#var cur_dir = dir.get_current_dir()
			#var full_path = cur_dir + '/' + file_name
			#if dir.current_is_dir():
				##print(dir.get_current_dir() + '/' + file_name)
				#if file_name != '.': 
					#var inner_dict = {"folder_name":file_name, "path":full_path, "previous_dir":path}
					#print("Found directory: " + full_path)
					#list.append(inner_dict)
			#else:
				#print("Found file: " + full_path)
				#list.append({"file_name":file_name, "path":full_path, "previous_dir":path})
			#file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return list

func load_json(path):
	var data = {}
	var json_text = load_from_file(path)
	if json_text:
		data = JSON.parse_string(json_text)
	return data

func save_json(path, json_dict):
	var json_string = JSON.stringify(json_dict)
	save_to_file(path, json_string)

func save_to_file(path, content):
	DirAccess.make_dir_recursive_absolute(path.get_base_dir())
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)

func load_from_file(path):
	var content = null
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		content = file.get_as_text()
	return content
