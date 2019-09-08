extends Reference


const Cell = preload("./cell.gd") 

const WIDTH = 32
const HEIGHT = 32
const DEPTH = 32


var cells = []




func _init():
	for x in range(WIDTH):
		cells.push_back([])
		for y in range(HEIGHT):
			cells[x].push_back([])
			for z in range(DEPTH):
				cells[x][y].push_back(Cell.new())




func draw_at(x, y, z, ci):
	if z < 0 or z >= DEPTH:
		assert(false)
	
	for i in range(WIDTH):
		for j in range(HEIGHT):
			cells[i][j][z].draw_at(x+i, y+j, ci)




func get_at(x, y, z):
	if x < 0 or x >= WIDTH or y < 0 or y >= HEIGHT or z < 0 or z >= DEPTH:
		assert(false)
	
	return cells[x][y][z]
