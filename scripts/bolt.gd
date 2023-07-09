extends Node2D

var enabled = false
@export var move_speed = 250
@export var direction = 1
@export var damage = 10

func fire():
	enabled = true
	
func _process(delta):
	if enabled:
		position.x = position.x + (move_speed * direction) * delta


func _on_area_2d_body_entered(body):
	if body.type == "hero":
		body.take_damage(50)
		queue_free()
