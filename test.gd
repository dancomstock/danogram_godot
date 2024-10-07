extends Node2D

var box_scene = load("res://box.tscn")
var puzzle_box_scene = load("res://puzzle_box.tscn")
var color_button_scene = load("res://color_button.tscn")

#var board = [
	#[1,0,1],
	#[0,0,0],
	#[1,1,1],
	#[1,1,1],
	#[1,1,1],
	#[1,1,1]
#]




var board = new_random_game(20, 20)
var row_puzzle = generate_puzzle(board)
var columns = rows_to_columns(board)
var column_puzzle = generate_puzzle(columns)


var input_rows

var zoom_level = Vector2(1,1)


func add_spaces_to_puzzle(puzzle_rows):
	var max_length = 0
	var new_rows = puzzle_rows.duplicate()

	for row in new_rows:
		if row.size() > max_length:
			max_length = row.size()
			
	var i = 0
	for new_row in new_rows:
		if new_row.size() < max_length:
			var temp_array = []
			temp_array.resize(max_length - new_row.size())
			temp_array.fill({"count":' ',"color":0})
			temp_array.append_array(new_rows[i])
			new_rows[i] = temp_array
		i += 1
		
	return new_rows

func new_random_game(x, y):
	var result = []
	for row in range(0, y):
		result.append([])
		for column in range(0, x):
			#randi_range(0,1)
			result[row].append(randi_range(0,2))
	return result


#func generate_puzzle_line(line):
	#var counter = 0
	#var solution_line = []
	#for box in line:
		#if box == 1:
			#counter += 1
		#elif counter > 0:
			#solution_line.append(counter)
			#counter = 0
	#if counter > 0 or solution_line == []:
		#if counter == 0:
			#solution_line.append(' ')
		#else:
			#solution_line.append(counter)
	#return solution_line
	
func generate_puzzle_line(line):
	var counter = 0
	var solution_line = []
	var last_color = -1
	for box in line:
		if box == last_color and box != 0:
			counter += 1
		elif last_color < 1 and box != 0:
			counter += 1
		elif counter > 0:
			solution_line.append({"count":counter,"color":last_color})
			if box == 0:
				counter = 0
			else: 
				counter = 1
		#elif last_color == 0 and box != 0:
			#counter += 1
		#elif box != 0 and counter == 0:
			#counter += 1
		last_color = box
	if counter > 0 or solution_line == []:
		if counter == 0:
			solution_line.append({"count":' ',"color":0})
		else:
			solution_line.append({"count":counter,"color":last_color})
	return solution_line
	

func generate_puzzle(rows):
	var row_solutions = []
	for row in rows:
		row_solutions.append(self.generate_puzzle_line(row))
	row_solutions = self.add_spaces_to_puzzle(row_solutions)
	return row_solutions


func create_blank_board(board):
	var result = []
	var i = 0
	for row in board:
		result.append([])
		for column in row:
			result[i].append(0)
		i += 1
	return result


func rows_to_columns(board):
	var result = []
	var row_amount = board.size()
	var column_amount = board[0].size()
	result.resize(column_amount)
	
	for n in range(0, column_amount):
		result[n] = []
		result[n].resize(row_amount)
		
	for i in range(0, row_amount):
		for j in range(0, column_amount):
			result[j][i] = board[i][j]
			
	return result


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var color_button_instance = color_button_scene.instantiate()
	color_button_instance.color_index = 1
	color_button_instance.position = Vector2(100,5)
	add_child(color_button_instance)
	color_button_instance.button_pressed = true
	
	var color_button_instance_2 = color_button_scene.instantiate()
	color_button_instance_2.color_index = 2
	color_button_instance_2.position = Vector2(125,5)   
	add_child(color_button_instance_2)
	
	
	#self.board = new_random_game(4, 3)
	Global.toggle_signal.connect(on_toggle_signal)
	for row in row_puzzle:
		var puzzle_box_instance = puzzle_box_scene.instantiate()
	var y = 40
	var y_index = 0
	var xn = 20
	for box in row_puzzle[0]:
		y = 40
		for column in column_puzzle[0]:
			var puzzle_box_instance = puzzle_box_scene.instantiate()
			add_child(puzzle_box_instance)
			puzzle_box_instance.text = str(' ')
			puzzle_box_instance.position = Vector2(xn,y)
			y += 20
		xn += 20
	for column in column_puzzle:
		y = 40
		for box in column:
			var puzzle_box_instance = puzzle_box_scene.instantiate()
			add_child(puzzle_box_instance)
			puzzle_box_instance.bg_color = Global.color_palette[box['color']]
			puzzle_box_instance.text = str(box['count'])
			puzzle_box_instance.position = Vector2(xn,y)
			y += 20
		xn += 20
			
	for row in board:
		var x = 20
		for box in row_puzzle[y_index]:
			var puzzle_box_instance = puzzle_box_scene.instantiate()
			add_child(puzzle_box_instance)
			puzzle_box_instance.bg_color = Global.color_palette[box['color']]
			puzzle_box_instance.text = str(box['count'])
			puzzle_box_instance.position = Vector2(x,y)
			x += 20
		var x_index = 0
		for box in row:
			var box_instance = box_scene.instantiate()
			add_child(box_instance)
			box_instance.x_index = x_index
			box_instance.y_index = y_index
			box_instance.position = Vector2(x,y)
			x += 20
			x_index += 1
		y += 20
		y_index += 1
	input_rows = create_blank_board(board)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func won():
	if self.input_rows == self.board:
		print('you win!')
		return true

func on_toggle_signal(x_index, y_index, toggled):
	if toggled == -1:
		toggled = 0
	self.input_rows[y_index][x_index] = toggled
	self.won()


func _input(event):
	if event.is_action_pressed("zoom_in"):
		zoom_level += Vector2(.1,.1)
		$Camera2D.zoom = zoom_level
	if event.is_action_pressed("zoom_out"):
		zoom_level -= Vector2(.1,.1)
		$Camera2D.zoom = zoom_level
		
	if event.is_action("camera_left"):
		$Camera2D.translate(Vector2(-5,0))
	if event.is_action("camera_right"):
		$Camera2D.translate(Vector2(5,0))
	if event.is_action("camera_up"):
		$Camera2D.translate(Vector2(0,-5))
	if event.is_action("camera_down"):
		$Camera2D.translate(Vector2(0,5))
	


func _on_button_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
