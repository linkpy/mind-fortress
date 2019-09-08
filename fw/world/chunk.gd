## Chunk Class.
#
# Manages a piece of the map.
extends Reference


# Cell class.
const Cell = preload("./cell.gd")

# Width of the chunk, in cells.
const WIDTH = 64
# Height of the chunk, in cells.
const HEIGHT = 64
# Depth of the chunk, in cells
const DEPTH = 64


# Cells of the chunk.
var cells = []



# Constructor.
func _init() -> void:
	for x in range(WIDTH):
		cells.push_back([])
		for y in range(HEIGHT):
			cells[x].push_back([])
			for z in range(DEPTH):
				cells[x][y].push_back(Cell.new())



# Get the cell from the chunk at the given position.
#
# x, y, z : Position.
# Returns the cell.
func get_cell_at(x: int, y: int, z: int) -> Cell:
	assert(x >= 0 and x < WIDTH)
	assert(y >= 0 and y < HEIGHT)
	assert(z >= 0 and z < DEPTH)
	
	return cells[x][y][z]

# Get the tile index of the cell at the given position.
#
# x, y, z : Position.
# returns the tile index.
func get_tile_at(x: int, y: int, z: int) -> int:
	return get_cell_at(x, y, z).tile_id

# Get the entities inside of the cell at the given position.
#
# x, y, z : Position.
# returns the entities at the given position.
func get_entities_at(x: int, y: int, z: int) -> Array:
	return get_cell_at(x, y, z).entities



# Defines the cell at the given position.
#
# x, y, z : Position.
# c : New cell.
func set_cell_at(x: int, y: int, z: int, c: Cell):
	assert(x >= 0 and x < WIDTH)
	assert(y >= 0 and y < HEIGHT)
	assert(z >= 0 and z < DEPTH)
	assert(c != null)
	
	cells[x][y][z] = c

# Defines the tile at the given position.
#
# x, y, z : Position.
# t : Tile index.
func set_tile_at(x: int, y: int, z: int, t: int):
	get_cell_at(x, y, z).tile_id = t

# Adds an entity in the cell at the given position.
#
# x, y, z : Position.
# e : Entity to add
func add_entity_at(x: int, y: int, z: int, e):
	assert(e != null)
	
	var c = get_cell_at(x, y, z)
	
	assert(c.entities.find(e) == -1)
	c.entities.push_back(e)

# Removes an entity form the cell at the given position.
#
# x, y, z : Position.
# e : Entity to remove.
func remove_entity_at(x: int, y: int, z: int, e):
	assert(e != null)
	
	var c = get_cell_at(x, y, z)
	
	c.entities.erase(e)
