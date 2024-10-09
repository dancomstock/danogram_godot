extends Control

var puzzle_scene = load("res://puzzle.tscn")

#var board = [
	#[1,2,3],
	#[4,5,6],
	#[4,5,6],
	#[7,8,9],
	#[4,5,6],
	#[7,8,9],
	#[7,8,9]
#]


#var board = [
	#[1,2,3],
	#[4,5,6]
#]

var board = [[0, 0, 0, 1, 0, 0, 2, 3], [0, 0, 0, 0, 1, 2, 3, 3], [0, 0, 4, 4, 1, 3, 3, 0], [0, 1, 5, 6, 1, 7, 4, 0], [0, 5, 5, 4, 7, 4, 4, 0], [0, 1, 5, 5, 5, 5, 4, 0], [0, 1, 5, 5, 5, 5, 1, 0], [0, 0, 1, 1, 5, 1, 0, 0]]
var input_rows
var path

#var color_palette = [Color.LIGHT_GRAY, Color.BLACK, Color.PINK, Color.YELLOW, Color.LAWN_GREEN, Color.DARK_BLUE, Color.CYAN, Color.ORANGE, Color.CORNFLOWER_BLUE, Color.CORAL]
var color_palette = ['#ffffff', '#b64824', '#00ff24', '#009148', '#ffb600', '#ff0048', '#6d4848', '#ffff24']

#var color_override = [Color.LIGHT_GRAY, Color.RED

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/Button.pressed.connect(self._on_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw():
	#var box_size = 5
	var x_size = self.board[0].size()
	var y_size = self.board.size()
	#var box_size = size.x/x_size
	var box_size = size.x/y_size if y_size > x_size else size.y/x_size
	var x_origin = size.x/2 - box_size*x_size/2
	var y_origin = size.y/2 - box_size*y_size/2
	for y in y_size:
		for x in x_size:
			#draw_rect(Rect2(x*box_size+x_origin,y*box_size+y_origin,box_size,box_size),self.color_palette[board[y][x]])
			draw_rect(Rect2(x*box_size+x_origin,y*box_size+y_origin,box_size,box_size),self.color_palette[board[y][x]])
			

func load_puzzle(path):
	var json = $json_loader.load_json(path)
	self.board = json['solution']
	self.color_palette = json['color_palette']
	self.input_rows = json['progress']

func _on_button_pressed():
	Global.x_size =  self.board[0].size()
	Global.y_size = self.board.size()
	Global.board = self.board
	Global.color_palette = self.color_palette
	get_tree().change_scene_to_packed(puzzle_scene)
