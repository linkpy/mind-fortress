extends Reference



const Tile = preload("./tile.gd")



var tiles = []



func _init():
	pass



func add_tile(bid: int, bbg: Color, bfg: Color, fid: int, fbg: Color, ffg: Color) -> Tile:
	var t = Tile.new(bid, bbg, bfg, fid, fbg, ffg)
	tiles.push_back(t)
	return t


