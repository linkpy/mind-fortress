extends Reference



const Tile = preload("./tile.gd")



var tiles = []

var names = {}




func add_tile(bid: int, bbg: Color, bfg: Color, fid: int, fbg: Color, ffg: Color) -> Tile:
	var t = Tile.new(bid, bbg, bfg, fid, fbg, ffg)
	tiles.push_back(t)
	return t



func name_tile(id: int, n: String):
	names[n] = id
	return self

func import_names(d: Dictionary):
	for k in d.keys():
		name_tile(d[k], k)
