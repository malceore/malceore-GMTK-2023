extends CharacterBody2D

@export var type = "hero"

@export var max_health = 100
@export var current_health = 100

@export var damage = 10
@export var range = 0
@export var attack_speed = 1

@export var move_speed = 100
@export var direction = -1


func _process(delta):
	position.x = position.x + (move_speed * direction) * delta
