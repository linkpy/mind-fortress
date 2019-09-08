extends Reference


const Cell = preload("./cell.gd")

const WIDTH = 64
const HEIGHT = 64
const DEPTH = 64


var cells = []



func _init() -> void:
	for x in range(WIDTH):
		cells.push_back([])
		for y in range(HEIGHT):
			cells[x].push_back([])
			for z in range(DEPTH):
				cells[x][y].push_back(Cell.new())



func get_cell_at(x: int, y: int, z: int) -> Cell:
	assert(x >= 0 and x < WIDTH)
	assert(y >= 0 and y < HEIGHT)
	assert(z >= 0 and z < DEPTH)
	
	return cells[x][y][z]

func get_tile_at(x: int, y: int, z: int) -> int:
	return get_cell_at(x, y, z).tile_id

func get_entities_at(x: int, y: int, z: int) -> Array:
	return get_cell_at(x, y, z).entities



func set_cell_at(x: int, y: int, z: int, c: Cell):
	assert(x >= 0 and x < WIDTH)
	assert(y >= 0 and y < HEIGHT)
	assert(z >= 0 and z < DEPTH)
	assert(c != null)
	
	cells[x][y][z] = c

func set_tile_at(x: int, y: int, z: int, t: int):
	get_cell_at(x, y, z).tile_id = t

func add_entity_at(x: int, y: int, z: int, e):
	assert(e != null)
	
	var c = get_cell_at(x, y, z)
	
	assert(c.entities.find(e) == -1)
	c.entities.push_back(e)

func remove_entity_at(x: int, y: int, z: int, e):
	assert(e != null)
	
	var c = get_cell_at(x, y, z)
	
	c.entities.erase(e)
