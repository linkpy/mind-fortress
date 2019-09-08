extends Reference



var texture: Texture
var count: Vector2
var size: Vector2



func _init(p: String, c: Vector2, s: Vector2) -> void:
	texture = load(p)
	count = c
	size = s



func get_sprite_position(id: int) -> Vector2:
	return Vector2(
		id % int(count.x),
		int(id / count.x)
	)

func get_sprite_index(pos: Vector2) -> int:
	return int(pos.y * count.x + pos.x)

func get_sprite_rectangle(id: int) -> Rect2:
	return Rect2(
		get_sprite_position(id) * size,
		size
	)


