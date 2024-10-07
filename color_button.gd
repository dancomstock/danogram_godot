extends Button

var color_index


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_color(Global.color_palette[self.color_index])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_color(color: Color):
	var style_box = StyleBoxFlat.new()
	var style_box_type = 'normal'
	var stylebox_theme: StyleBoxFlat = self.get_theme_stylebox(style_box_type)
	style_box.bg_color = color
	style_box.border_color = color
	style_box.set_corner_radius_all(3)
	#self.add_theme_stylebox_override(style_box_type, stylebox_theme)
	self.add_theme_stylebox_override('normal', style_box)
	set("theme_override_styles/normal", Color.YELLOW)
	set('theme_override_colors/icon_normal_color', Color.YELLOW)

func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.color_signal.emit(self.color_index)
