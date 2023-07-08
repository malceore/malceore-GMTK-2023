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

var enemies_in_range = []


func _process(delta):
	if(enemies_in_range.size() == 0):
		position.x = position.x + (move_speed * direction) * delta
	else:
		attack_enemy()

func attack_enemy():
	if enemies_in_range.size() != 0:
		enemies_in_range[0].take_damage(damage)

func escape():
	get_parent().money_update.emit(-1)
	queue_free()

func take_damage(damageAmount):
	current_health -= damageAmount
	if current_health <= 0:
		if spawns_coin:
			var coin_instance = coin.instantiate()
			coin_instance.global_position = global_position
			get_parent().add_child(coin_instance)
		queue_free()


func _on_attack_area_body_entered(body):
	if body.type != null && body.type != type:
		enemies_in_range.append(body)


func _on_attack_area_body_exited(body):
	var enemy_position = enemies_in_range.find(body)
	if enemy_position > -1:
		enemies_in_range.remove_at(enemy_position)
