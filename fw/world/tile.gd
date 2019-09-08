extends Reference



var block_sprite_id = 0
var block_background_color = Color(0, 0, 0)
var block_foreground_color = Color(1, 1, 1)

var floor_sprite_id = 0
var floor_background_color = Color(0, 0, 0)
var floor_foreground_color = Color(1, 1, 1)

var is_walkable = true
var is_opaque = true



func _init(bid: int, bbg: Color, bfg: Color, fid: int, fbg: Color, ffg: Color):
	block_sprite_id = bid
	block_background_color = bbg
	block_foreground_color = bfg
	floor_sprite_id = fid
	floor_background_color = fbg
	floor_foreground_color = ffg



func not_walkable():
	is_walkable = false
	return self

func not_opaque():
	is_opaque = false
	return self
