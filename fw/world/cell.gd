## Cell Class
#
# A cell in the world.
extends Reference


# Tile of the cell.
var tile_id = 0

# Entities in the cell.
# Should be empty if `tile_id` isn't 0.
var entities = []