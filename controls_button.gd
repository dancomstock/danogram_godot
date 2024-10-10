extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self._button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _button_pressed():
	if button_pressed:
		$RichTextLabel.visible = true
	else:
		$RichTextLabel.visible = false
