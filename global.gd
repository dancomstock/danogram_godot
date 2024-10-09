extends Node

var json_loader = load("res://json_loader.tscn").instantiate()

signal toggle_signal
signal cross_signal
signal color_signal
signal folder_signal

var last_toggle
var selected_color = 1

var x_size
var y_size

#var colors = [Color.BLACK, Color.AQUA]

var color_palette = [Color.LIGHT_GRAY, Color.BLACK, Color.PINK]
var color_override = []

var board = []
var progress
var path
var complete


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.toggle_signal.connect(on_toggle_signal)
	self.color_signal.connect(on_color_signal)
	add_child(json_loader)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_toggle_signal(x_index, y_index, toggled):
	self.last_toggle = toggled

func on_color_signal(color_index):
	self.selected_color = color_index
