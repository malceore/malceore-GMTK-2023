extends CharacterBody2D

var coin = preload("res://scenes/coin.tscn")
var fighter_texture = preload("res://sprites/fighter.png")
var mage_texture = preload("res://sprites/mage.png")

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
	queue_free()
	
func set_subtype(new_subtype):
	subtype = new_subtype
	if new_subtype == "fighter":
		$Sprite2D.texture = fighter_texture
	elif new_subtype == "mage":
		$Sprite2D.texture = mage_texture

func take_damage(damage):
	current_health -= damage
	if current_health <= 0 and spawns_coin:
		var coin_instance = coin.instantiate()
		get_parent().add_child(coin_instance)		
		queue_free()
