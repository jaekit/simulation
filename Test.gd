extends Node


class TestClass: # Represents a Gas at r, c
	var r: int
	var c: int
	var type: int
	
	func _init(r: int, c: int, type: int) -> void:
		self.r = r
		self.c = c
		self.type = type


var table_of_objects := []
var table_of_types := []


func _ready() -> void:
	for i in range(300):
		table_of_objects.append([])
		table_of_types.append([])
		for j in range(300):
			var rand_type := randi() % 2
			table_of_objects[i].append(TestClass.new(i, j, rand_type))
			
			table_of_types[i].append(rand_type)
