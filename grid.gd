extends Node2D

var parent = get_parent()

#var puzzle_line_scene = load("res://puzzle_line.tscn")
var puzzle_box_scene = load("res://puzzle_box.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


#func add_tags(text):
	#var result = '[center][color=black]' + text + '[/color][/center]'
	#print(result)
	#return result

#func add_label(x, y, text):
	#var puzzle_box_instance =  puzzle_box_scene.instantiate()
	#add_child(puzzle_box_instance)
	#puzzle_box_instance.text = text
	##puzzle_line_instance.horizontal_aligntment=HORIZONTAL_ALIGNMENT_RIGHT
	##puzzle_line_instance.horizontal_alignment=HORIZONTAL_ALIGNMENT_RIGHT
	#puzzle_box_instance.position = Vector2(x ,y)
	


func _draw():
	var row_amount = get_parent().board.size() + get_parent().column_puzzle[0].size()
	var column_amount = get_parent().board[0].size() + get_parent().row_puzzle[0].size()
	var box_size = 20
	var column_length = column_amount * box_size
	var row_length = row_amount * box_size
	var x_origin = 10
	var y_origin = 30
	
	draw_line(Vector2(x_origin, y_origin), Vector2(column_length+x_origin, y_origin), Color.DARK_GRAY, 3)
	draw_line(Vector2(x_origin, y_origin), Vector2(x_origin, row_length+y_origin), Color.DARK_GRAY, 3)
	for y in range(1,row_amount+1):
		var size = 1
		if (y - get_parent().column_puzzle[0].size()) % 5 == 0 or y == row_amount:
			size = 3
		var y_loc = y_origin + y * box_size
		draw_line(Vector2(x_origin, y_loc), Vector2(x_origin + column_length, y_loc), Color.DARK_GRAY, size)
		#var row_puzzle = get_parent().row_puzzle[y-1]
		#var n = 0
		#for n in range(-1,-row_puzzle.size()-1,-1):
		##for box in row_puzzle:
			##self.add_label(x_origin+n*20+8-n, y_loc - 9 - y, str(row_puzzle[n]))
			#self.add_label(x_origin+n*20+8-n, y_loc - 9 - y, str(row_puzzle[n]))
			#n += 1
		#self.add_label(-3*x_origin, y_loc - y_origin/1.5, str(get_parent().row_puzzle[y-1]))
	for x in range(1,column_amount+1):
		var size = 1
		if (x - get_parent().row_puzzle[0].size()) % 5 == 0 or x == column_amount:
			size = 3
		var x_loc = x_origin + x * box_size
		draw_line(Vector2(x_loc, y_origin), Vector2(x_loc, y_origin + row_length), Color.DARK_GRAY, size)
		#var ts = str(get_parent().column_puzzle[x-1]) + '\n'
		#self.add_label(x_loc - x_origin, y_origin, ts)
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
