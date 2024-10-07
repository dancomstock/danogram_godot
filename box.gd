extends Area2D

var toggled = 0
var x_index
var y_index

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("left_click"):
		#$ColorRect.visible = !$ColorRect.visible
		#self.toggled = !self.toggled
		#

#func toggle():
	#if self.toggled == 0:
		#$ColorRect.visible = true
		#$Label.visible = false
		#self.toggled = 1
	#elif self.toggled == 1:
		#$ColorRect.visible = false
		#$Label.visible = false
		#self.toggled = 0
	#Global.toggle_signal.emit(self.x_index, self.y_index, self.toggled)
	
func toggle(toggle_to = 'toggle'):
	if toggle_to == 'cross':
		if $Label.visible:
			self.toggled = 0
			$Label.visible = false
		else:
			self.toggled = -1
			$ColorRect.visible = false
			$Label.visible = true
	elif toggle_to == 'off':
		$ColorRect.visible = false
		$Label.visible = false
		self.toggled = 0
	else:
		if self.toggled != Global.selected_color:
			$ColorRect.visible = true
			$Label.visible = false
			self.toggled = Global.selected_color
		else:
			$ColorRect.visible = false
			$Label.visible = false
			self.toggled = 0
	Global.toggle_signal.emit(self.x_index, self.y_index, self.toggled)

func cross_out():
	if $Label.visible:
		self.toggled = 0
		$Label.visible = false
	else:
		self.toggled = -1
		$ColorRect.visible = false
		$Label.visible = true
	Global.toggle_signal.emit(self.x_index, self.y_index, self.toggled)
	

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		self.toggle()
	if event.is_action_pressed("right_click"):
		#self.cross_out()
		self.toggle('cross')
		


func _on_mouse_entered() -> void:
	if Input.is_action_pressed("left_click"):
		if Global.last_toggle == 0:
			self.toggle('off')
		elif Global.last_toggle != self.toggled:
			self.toggle()
	if Input.is_action_pressed("right_click"):
		if Global.last_toggle == -1:
			self.toggle('cross')
		else:
			self.toggle('off')
