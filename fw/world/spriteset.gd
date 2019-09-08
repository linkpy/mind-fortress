## SpriteSet Class.
#
# Utility class, handling and managing sprites in a spritesheet image.
#
extends Reference



# Loaded spritesheet. 
var texture: Texture
# Number of sprites in the spritesheet.
var count: Vector2
# Size of a sprite.
var size: Vector2

# List of named sprites.
var names = []



# Constructor.
#
# p : Path to the spritesheet.
# c : Number of sprites.
# s : Size of a sprite.
func _init(p: String, c: Vector2, s: Vector2) -> void:
	texture = load(p)
	count = c
	size = s
	
	names.resize(int(c.x*c.y))



# Get the sprite coordinate based on its index.
# The first sprite is the top-left one, the last is the bottom-right one.
#
# id : index of the sprite.
# returns the position of the sprite, not in pixel.
#
# eg: the sprite (2, 3) is the third sprite of the fourth line.
func get_sprite_position(id: int) -> Vector2:
	assert(id >= 0 and id < int(count.x*count.y))
	
	return Vector2(
		id % int(count.x),
		int(id / count.x)
	)

# Get the sprite index based on its coordinate.
#
# pos : position of the sprite
# returns the index of the sprite.
func get_sprite_index(pos: Vector2) -> int:
	assert(pos.x >= 0 and pos.x < count.x)
	assert(pos.y >= 0 and pos.y < count.y)
	
	return int(pos.y * count.x + pos.x)

# Get the rectangle of the given sprite in the spritesheet.
#
# id : index of the sprite
# returns the rectangle, in pixels, of the sprite.
func get_sprite_rectangle(id: int) -> Rect2:
	assert(id >= 0 and id < int(count.x*count.y))
	
	return Rect2(
		get_sprite_position(id) * size,
		size
	)



# Gives a name to the given sprite.
#
# id : Index of the sprite
# n : name of the sprite
# returns the spriteset.
func name_sprite(id: int, n: String):
	assert(id >= 0 and id < int(count.x*count.y))
	
	names[id] = n
	return self

# Imports the sprite's names from a list.
#
# sid : First sprite of the list.
# list : The list of names.
# return the spriteset.
func import_names(sid: int, list: Array):
	for i in range(list.size()):
		name_sprite(sid+i, list[i])
	
	return self

# Get the index of the given named sprite.
#
# n : the name of the sprite
# returns the index of the named sprite.
func get_named_sprite_index(n: String) -> int:
	return names.find(n)
