extends Node

var puzzle_scene = load("res://puzzle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var puzzle_instance = puzzle_scene.instantiate()
	#add_child(puzzle_instance)
	$start_button.pressed.connect(self._start_button_pressed)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_button_pressed():
	get_tree().change_scene_to_packed(puzzle_scene)
