extends Node2D

@export var coinValue = 1


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		get_parent().money_update.emit(1)
		AudioListener2D
		queue_free()
