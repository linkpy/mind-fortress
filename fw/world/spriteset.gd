extends Reference



var texture: Texture
var count: Vector2
var size: Vector2

var names = []



func _init(p: String, c: Vector2, s: Vector2) -> void:
	texture = load(p)
	count = c
	size = s
	
	names.resize(int(c.x*c.y))



func get_sprite_position(id: int) -> Vector2:
	assert(id >= 0 and id < int(count.x*count.y))
	
	return Vector2(
		id % int(count.x),
		int(id / count.x)
	)

func get_sprite_index(pos: Vector2) -> int:
	assert(pos.x >= 0 and pos.x < count.x)
	assert(pos.y >= 0 and pos.y < count.y)
	
	return int(pos.y * count.x + pos.x)

func get_sprite_rectangle(id: int) -> Rect2:
	assert(id >= 0 and id < int(count.x*count.y))
	
	return Rect2(
		get_sprite_position(id) * size,
		size
	)



func name_sprite(id: int, n: String):
	assert(id >= 0 and id < int(count.x*count.y))
	
	names[id] = n
	return self

func import_names(sid: int, list: Array):
	for i in range(list.size()):
		name_sprite(sid+i, list[i])

func get_named_sprite_index(n: String) -> int:
	return names.find(n)
