extends Reference


const Chunk = preload("./chunk.gd")
const Cell = preload("./cell.gd")


var width = 4
var height = 4
var depth = 2



var chunks = []



func _init(w: int = 4, h: int = 4, d: int = 2) -> void:
	width = w
	height = h
	depth = d
	
	for x in range(width):
		chunks.push_back([])
		for y in range(height):
			chunks[x].push_back([])
			for z in range(depth):
				chunks[x][y].push_back(Chunk.new())



func get_chunk_containing(x: int, y: int, z: int) -> Vector3:
	return Vector3(
		int(x / Chunk.WIDTH),
		int(y / Chunk.HEIGHT),
		int(z / Chunk.DEPTH)
	)



func get_cell_at(x: int, y: int, z: int) -> Cell:
	var cpos = get_chunk_containing(x, y, z)
	
	assert(cpos.x >= 0 and cpos.x < width)
	assert(cpos.y >= 0 and cpos.y < height)
	assert(cpos.z >= 0 and cpos.z < depth)
	
	x -= cpos.x * Chunk.WIDTH
	y -= cpos.y * Chunk.HEIGHT
	z -= cpos.z * Chunk.DEPTH
	
	return chunks[x][y][z].get_cell_at(x, y, z)

func get_tile_at(x: int, y: int, z: int) -> int:
	return get_cell_at(x, y, z).tile_id

func get_entities_at(x: int, y: int, z: int) -> Array:
	return get_cell_at(x, y, z).entities



func set_cell_at(x: int, y: int, z: int, c: Cell):
	var cpos = get_chunk_containing(x, y, z)
	
	assert(cpos.x >= 0 and cpos.x < width)
	assert(cpos.y >= 0 and cpos.y < height)
	assert(cpos.z >= 0 and cpos.z < depth)
	
	x -= cpos.x * Chunk.WIDTH
	y -= cpos.y * Chunk.HEIGHT
	z -= cpos.z * Chunk.DEPTH
	
	return chunks[x][y][z].set_cell_at(x, y, z, c)

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