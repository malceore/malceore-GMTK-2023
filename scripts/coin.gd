extends Node2D

@export var coinValue = 1


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		get_parent().money_update.emit(1)
		$Area2D.input_pickable = false
		$AudioStreamPlayer.play()
		await $AudioStreamPlayer.finished
		queue_free()
