extends "res://fw/world/spriteset.gd"



const TEXTURE = "res://world/assets/tileset.png"

const TILE_COUNT = Vector2(16,16)
const TILE_SIZE = Vector2(18,18)

const NAMES = [
	" ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
	"p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4",
	"5", "6", "7", "8", "9", ".", ",", ";", ":", "!", "?", "/", "+", "-", "*", "$",
	"%", "^", ">", "<", "=", "_", "~", '"', "'", "#", "(", ")", "[", "]", "{", "}",
	"2~", 
	"full", 
	"half",
	"vwall", "hwall", "xwall",
	"trwall", "tlwall", "tdwall", "tuwall",
	"cdwall", "crwall", "cuwall", "clwall",
	"fullwall",
	"plot", "plant", "tree", "grass"
]


func _init().(TEXTURE, TILE_COUNT, TILE_SIZE):
	import_names(0, NAMES)