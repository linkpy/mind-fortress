extends Reference

const Tileset = preload("./tileset.gd")



var tile_id = 0
var background_color = Color.black;
var foreground_color = Color.white;



func draw_at(x, y, ci):
	if tile_id < 0:
		return
	
	var drect = Rect2(
		Vector2(x, y)*Tileset.TILE_SIZE, 
		Tileset.TILE_SIZE
	)
	
	ci.draw_rect(drect, background_color)
	
	if tile_id != 0:
		ci.draw_texture_rect_region(
			Tileset.TEXTURE,
			drect,
			Tileset.get_tile_rect(tile_id),
			foreground_color
		)
