extends Camera2D


var speed := 1000
var zoom_amount = 1.0


func _process(delta: float) -> void:
	if Input.is_action_pressed("W"):
		offset += Vector2(0, -1) * delta * speed
	if Input.is_action_pressed("S"):
		offset += Vector2(0, 1) * delta * speed
	if Input.is_action_pressed("A"):
		offset += Vector2(-1, 0) * delta * speed
	if Input.is_action_pressed("D"):
		offset += Vector2(1, 0) * delta * speed
	if Input.is_action_just_released("zoom_out"):
		zoom_camera(1.1)
	elif Input.is_action_just_released("zoom_in"):
		zoom_camera(1 / 1.1)
	
	offset.x = clamp(offset.x, limit_left, limit_right)
	offset.y = clamp(offset.y, limit_top, limit_bottom)


func zoom_camera(zoom_factor: float) -> void:
	var zoom_point := get_global_mouse_position()
	zoom_amount *= zoom_factor
	zoom_amount = clamp(zoom_amount, 0.5, 4.0)
	zoom = Vector2(1, 1) * zoom_amount
	offset += (zoom_point - get_global_mouse_position())
	speed = 1000 * zoom_amount
