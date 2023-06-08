extends Node2D


enum Overlay {
	NONE = -1,
	GAS,
}


const overlay_inputs := [
	"overlay_gas"
]

var current_overlay: int = Overlay.NONE
var overlays: Array


func _ready() -> void:
	overlays = [
		$GasOverlay
	]


func _input(event: InputEvent) -> void:
	for i in range(overlay_inputs.size()):
		if event.is_action_pressed(overlay_inputs[i]):
			set_overlay(i)


func set_overlay(overlay: int) -> void:
	overlays[current_overlay].hide()
	if overlay == current_overlay:
		current_overlay = Overlay.NONE
	else:
		current_overlay = overlay
		overlays[overlay].show()
