extends Button

var main_scene = load("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self._button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _button_pressed():
	var path = Global.path
	#var save_path = Global.path.replace("res://puzzles","user://saves/")
	#save_path = Global.path.replace("user://puzzles","user://saves/")
	var save_path
	if path.contains("res://puzzles/"):
		save_path = path.replace("res://puzzles/","user://saves/")
	elif path.contains("user://puzzles/"):
		save_path = path.replace("user://puzzles/","user://saves/custom/")
	var json = {
		'progress':Global.progress,
		'complete':Global.complete
	}
	print(json)
	
	Global.json_loader.save_json(save_path, json)
	get_tree().change_scene_to_packed(main_scene)
