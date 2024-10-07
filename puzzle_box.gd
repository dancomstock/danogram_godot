extends Area2D

var _text

var text: String:
	get:
		#return $RichTextLabel.text
		return _text
	set(value):
		$RichTextLabel.text = '[center][color='+ self._text_color +']' + value + '[/color][/center]'
		$X.text = '[center][color='+ self._text_color +']' + 'X' + '[/color][/center]'
		self._text = value
		
var _text_color: String:
	get:
		if self.bg_color.get_luminance() < .5:
			return 'white'
		else:
			return 'black'

var bg_color:
	get:
		return $ColorRect.color
	set(value):
		if typeof(value) == TYPE_COLOR:
			$ColorRect.color = value
		
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click") or event.is_action_pressed("right_click"):
		if self._text != ' ':
			if $X.visible:
				$X.visible = false
			else:
				$X.visible = true
