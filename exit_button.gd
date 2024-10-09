extends Button

var main_scene = load("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self._button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _button_pressed():
	Global.path = Global.path.replace("res://","user://")
	var json = {
		'progress':Global.progress,
		'complete':Global.complete
	}
	print(json)
	
	Global.json_loader.save_json(Global.path, json)
	get_tree().change_scene_to_packed(main_scene)
