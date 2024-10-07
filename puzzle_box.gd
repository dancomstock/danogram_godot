extends Node2D

var text: String:
	get:
		return $RichTextLabel.text
	set(value):
		$RichTextLabel.text = '[center][color=black]' + value + '[/color][/center]'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
