extends PopupPanel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw():
	var box_size = 30
	for y in board.size():
		for x in board[0].size():
			draw_rect(Rect2(x*box_size,y*box_size,box_size,box_size),Global.color_palette[board[y][x]])
