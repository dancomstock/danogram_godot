extends Container


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw():
	var board = get_parent().get_parent().board
	#var box_size = 30
	#var x_origin = -board[0].size()/2 * box_size
	#var y_origin = -board.size()/2 * box_size
	#for y in board.size():
		#for x in board[0].size():
			#draw_rect(Rect2(x*box_size+x_origin,y*box_size+y_origin,box_size,box_size),Global.color_palette[board[y][x]])
	#var box_size = 5
	var x_size = board[0].size()
	var y_size = board.size()
	#var box_size = size.x/x_size
	var box_size = size.x/y_size if y_size > x_size else size.y/x_size
	var x_origin = size.x/2 - box_size*x_size/2
	var y_origin = size.y/2 - box_size*y_size/2
	for y in y_size:
		for x in x_size:
			#draw_rect(Rect2(x*box_size+x_origin,y*box_size+y_origin,box_size,box_size),self.color_palette[board[y][x]])
			draw_rect(Rect2(x*box_size+x_origin,y*box_size+y_origin,box_size,box_size),Global.color_palette[board[y][x]])
