extends Node2D

var enabled = false
@export var move_speed = 200
@export var direction = 1
@export var damage = 10

func fire():
	enabled = true
	
func _process(delta):
	if enabled:
		position.x = position.x + (move_speed * direction) * delta

func _on_area_2d_area_entered(area):
	print(area.name)
