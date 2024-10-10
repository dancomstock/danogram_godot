extends Node

var puzzle_scene = load("res://puzzle.tscn")
var puzzle_container_scene = load("res://puzzle_container.tscn")
var folder_scene = load("res://folder.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().auto_accept_quit = true
	Global.folder_signal.connect(_on_folder_signal)
	#var puzzle_instance = puzzle_scene.instantiate()
	#add_child(puzzle_instance)
	#get_viewport().size = DisplayServer.screen_get_size()
	#$start_button.pressed.connect(self._start_button_pressed)
	#
	#var puzzles = $json_loader.get_puzzles("res://puzzles")
	#print(puzzles)
	#for file in puzzles['files']:
		#if typeof(file) == TYPE_DICTIONARY:
			#var folder_instance = folder_scene.instantiate()
			#folder_instance.folder_name = file['folder_name']
			#folder_instance.files = file['files']
			#folder_instance.previous_dir = file['previous_dir']
			#$HFlowContainer.add_child(folder_instance)
		#if typeof(file) == TYPE_STRING:
			#var puzzle_container_instance = puzzle_container_scene.instantiate()
			#puzzle_container_instance.load_puzzle(file)
			#$HFlowContainer.add_child(puzzle_container_instance)
			
	#for i in 20:
		#var puzzle_container_instance = puzzle_container_scene.instantiate()
		#$HFlowContainer.add_child(puzzle_container_instance)
	#
	#DirAccess.make_dir_recursive_absolute("user://puzzles")
	#var folder_instance = folder_scene.instantiate()
	#folder_instance.folder_name = 'custom'
	#folder_instance.path = "user://puzzles"
	#$HFlowContainer.add_child(folder_instance)
	self._display_folder("res://puzzles")
	#self._display_folder("user://puzzles")
	#self._display_folder("user://puzzles")
	

func _display_folder(path):
	var contents = $json_loader._single_dir_contents(path)
	#print(contents)
	#for file in contents['files']:
		#if typeof(file) == TYPE_DICTIONARY:
			#var folder_instance = folder_scene.instantiate()
			#folder_instance.folder_name = file['folder_name']
			#folder_instance.files = file['files']
			#folder_instance.previous_dir = file['previous_dir']
			#$HFlowContainer.add_child(folder_instance)
		#if typeof(file) == TYPE_STRING:
			#var puzzle_container_instance = puzzle_container_scene.instantiate()
			#puzzle_container_instance.load_puzzle(file)
			#$HFlowContainer.add_child(puzzle_container_instance)
	#if path != "res://puzzles":
		#var folder_instance = folder_scene.instantiate()
		#folder_instance.folder_name = '..'
		#folder_instance.path = path + '/..'
		#$HFlowContainer.add_child(folder_instance)
	for file in contents:
		if file.has('folder_name'):
			var folder_instance = folder_scene.instantiate()
			folder_instance.folder_name = file['folder_name']
			folder_instance.path = file['path']
			$HFlowContainer.add_child(folder_instance)
		if file.has('file_name'):
			var puzzle_container_instance = puzzle_container_scene.instantiate()
			puzzle_container_instance.load_puzzle(file['path'])
			$HFlowContainer.add_child(puzzle_container_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_button_pressed():
	Global.x_size = 5
	Global.y_size = 1
	get_tree().change_scene_to_packed(puzzle_scene)
	
func _on_folder_signal(path):
	for child in $HFlowContainer.get_children():
		child.queue_free()
	self._display_folder(path)
