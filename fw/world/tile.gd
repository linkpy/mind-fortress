## Tile Class
#
# A tile definition.
extends Reference



# The sprite index of the tile as a block
var block_sprite_id = 0
# The forground color of the tile as a block
var block_foreground_color = Color(1, 1, 1)
# The background color of the tile as a block
var block_background_color = Color(0, 0, 0)

# The sprite index of the tile as floor
var floor_sprite_id = 0
# The foreground color of the tile as floor
var floor_foreground_color = Color(1, 1, 1)
# The background color of the tile as floor
var floor_background_color = Color(0, 0, 0)

# Defines if the tile is walkable
var is_walkable = true
# Defines if the tile allows light to pass through it.
var is_opaque = true



# Constructor.
#
# bid : Sprite index of the tile as a block
# bfg : Foreground color of the tile as a block
# bbg : Background color of the tile as a block
# fid : Sprite index of the tile as floor
# ffg : Foreground color of the tile as floor
# fbg : Background color of the tile as floor
func _init(bid: int, bbg: Color, bfg: Color, fid: int, fbg: Color, ffg: Color):
	block_sprite_id = bid
	block_background_color = bbg
	block_foreground_color = bfg
	floor_sprite_id = fid
	floor_background_color = fbg
	floor_foreground_color = ffg



# Makes the tile not walkable.
#
# Returns the tile.
func not_walkable():
	is_walkable = false
	return self

# Makes the tile not opaque.
#
# Returns the tile.
func not_opaque():
	is_opaque = false
	return self
