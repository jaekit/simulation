extends TileMap


enum Type {
	OXYGEN,
	CO2,
	NITROGEN,
}

const GAS_SCENES := [
	preload("res://src/GasTiles/Oxygen.gd"),
	preload("res://src/GasTiles/CO2.gd"),
	preload("res://src/GasTiles/Nitrogen.gd"),
]

const WEIGHT := [
	32, # OXYGEN
	44, # CO2
	28, # NITROGEN
]


#var table: Array


func _ready() -> void:
#	table = []
	for i in range(Global.MAP_TILE_ROWS):
#		table.append([])
		for j in range(Global.MAP_TILE_COLS):
			set_cell(j, i, randi() % GAS_SCENES.size())
#			table[i].append(GAS_SCENES[randi() % GAS_SCENES.size()].new(Vector2(j, i)))
#			add_child(table[i][j])


func _process(delta: float) -> void:
	for i in range(300):
		var row := randi() % Global.MAP_TILE_ROWS
		var col := randi() % Global.MAP_TILE_COLS
		update_gas(row, col, row - 1, col)
		update_gas(row, col, row, col + 1)
		update_gas(row, col, row, col - 1)


func update_gas(row: int, col: int, row2: int, col2: int) -> void:
	if row2 < 0 or row2 >= 300 or col2 < 0 or col2 >= 300:
		return
	if row2 - row < 0: # DOWN
		if WEIGHT[get_cell(col2, row2)] > WEIGHT[get_cell(col, row)]:
#		if table[row2][col2].weight > table[row][col].weight:
			swap(row, col, row2, col2)
	elif randi() % 100 < 20:
		swap(row, col, row2, col2)


func swap(row: int, col: int, row2: int, col2: int) -> void:
	var temp := get_cell(col, row)
	set_cell(col, row, get_cell(col2, row2))
	set_cell(col2, row2, temp)
#	var temp: GasTile = table[row2][col2]
#	table[row2][col2] = table[row][col]
#	table[row][col] = temp
#	var temp2: Vector2 = table[row][col].position
#	table[row][col].position = table[row2][col2].position
#	table[row2][col2].position = temp2
