extends Control

var main_scene = load("res://main.tscn")

var folder_name
var files
var previous_dir
var path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.text = self.folder_name
	$Button.pressed.connect(self._on_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed():
	#get_tree().change_scene_to_packed(main_scene)
	Global.folder_signal.emit(path)
