class_name GasTile extends Sprite


const ALPHA := 0.4

var weight: int


func _init(cell_pos: Vector2) -> void:
	self.position = cell_pos * Global.TILE_SIZE
	texture = preload("res://src/GasTiles/1x1.png")
	scale = Vector2(1, 1) * Global.TILE_SIZE
