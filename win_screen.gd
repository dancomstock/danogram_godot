extends CanvasLayer

var board

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func _draw():
	#var box_size = 20
	#for y in board.size():
		#for x in board[0].size():
			#$Control.draw_rect(Rect2(x*box_size,y*box_size,box_size,box_size),Global.color_palette[board[y][x]])

func center_drawing():
	$CenterContainer/Completed.anchor_left = 0.5
	$CenterContainer/Completed.anchor_right = 0.5
	$CenterContainer/Completed.anchor_top = 0.5
	$CenterContainer/Completed.anchor_bottom = 0.5
	var texture_size = $CenterContainer/Completed.get_size()
	$CenterContainer/Completed.offset_left = -texture_size.x / 2
	$CenterContainer/Completed.offset_right = texture_size.x / 2
	$CenterContainer/Completed.offset_top = -texture_size.y / 2
	$CenterContainer/Completed.offset_bottom = texture_size.y / 2
	
	
