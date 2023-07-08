extends Sprite2D


@export var coinValue = 1



func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		AudioStreamPlayback
		queue_free()
