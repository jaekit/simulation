extends Node2D


const GRID_SIZE = 2
var table: Array = []


enum Direction {
	UP, DOWN, LEFT, RIGHT
}


func _ready() -> void:
#	for i in range(300):
#		table.append([])
#		for j in range(300):
#			var rand := randi() % 3
#			if rand == 0:
#				table[i].append(Oxygen.new(Vector2(j * GRID_SIZE, i * GRID_SIZE)))
#			elif rand == 1:
#				table[i].append(CO2.new(Vector2(j * GRID_SIZE, i * GRID_SIZE)))
#			else:
#				table[i].append(Nitrogen.new(Vector2(j * GRID_SIZE, i * GRID_SIZE)))
#			add_child(table[i][j])
	var t1 = []
	var t2 = []
	var t3 = []
	for i in range(300):
		t1.append([])
		t2.append([])
		t3.append(PoolIntArray())
		for j in range(300):
			t1[i].append(1)
			var array = t3[i]
			array.push_back(1)
			t3[i] = array
			
			t2[i].append(Oxygen.new(Vector2(j, i)))
	
	var start = OS.get_system_time_msecs()
	for i in range(300):
		for j in range(300):
			var k = 0
	print(OS.get_system_time_msecs() - start)
	start = OS.get_system_time_msecs()
	for i in range(300):
		for j in range(300):
			var k = t1[i][j]
			
	print(OS.get_system_time_msecs() - start)
	

	start = OS.get_system_time_msecs()
	for i in range(300):
		for j in range(300):
			var k: Oxygen = t2[i][j]
	print(OS.get_system_time_msecs() - start)


func _physics_process(_delta: float) -> void:
	pass
#	for i in range(900):
#		var row = randi() % 300
#		var col = randi() % 300
#		update_gas(row, col, row - 1, col)
#		update_gas(row, col, row, col + 1)
#		update_gas(row, col, row, col - 1)
#		update_gas(Vector2(row, col), Vector2(row - 1, col))
#		update_gas(Vector2(row, col), Vector2(row, col + 1))
#		update_gas(Vector2(row, col), Vector2(row, col - 1))

#	row += 1
#	row %= 300


func update_gas(row: int, col: int, row2: int, col2: int) -> void:
	if row2 < 0 or row2 >= 300 or col2 < 0 or col2 >= 300:
		return
	if row2 - row < 0: # DOWN
		if table[row2][col2].weight > table[row][col].weight:
			swap(row, col, row2, col2)
	elif randi() % 100 < 20:
		swap(row, col, row2, col2)


func swap(row: int, col: int, row2: int, col2: int) -> void:
	var temp: GasTile = table[row2][col2]
	table[row2][col2] = table[row][col]
	table[row][col] = temp
	var temp2: Vector2 = table[row][col].position
	table[row][col].position = table[row2][col2].position
	table[row2][col2].position = temp2
