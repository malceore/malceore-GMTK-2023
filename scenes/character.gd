extends CharacterBody2D

var coin = preload("res://scenes/coin.tscn")

@export var type = "hero"
@export var subtype = "warrior"
@export var spawns_coin = false

@export var max_health = 100
@export var current_health = 100

@export var damage = 10
@export var range = 0
@export var attack_speed = 1

@export var move_speed = 100
@export var direction = 1


func _process(delta):
	position.x = position.x + (move_speed * direction) * delta

func escape():
	get_parent().money_update.emit(-1)
	queue_free()

func take_damage(damage):
	current_health -= damage
	if current_health <= 0 and spawns_coin:
		var coin_instance = coin.instantiate()
		get_parent().add_child(coin_instance)		
		queue_free()
