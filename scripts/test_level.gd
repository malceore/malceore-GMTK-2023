extends Node2D

signal money_update(amount)

var hero_array = [preload("res://scenes/fighter.tscn"),
				  preload("res://scenes/mage.tscn"),
				  preload("res://scenes/rogue.tscn")]
var heldRoom = null
var holdingRoom = false

@onready var spawn_point_array = [$Row1/hero_spawner.global_position,
						 		  $Row2/hero_spawner.global_position,
						 		  $Row3/hero_spawner.global_position]

var rng = RandomNumberGenerator.new()

func _on_button_pressed():
	$Timer.start()


func spawn_hero():
	var hero_instance = hero_array[rng.randi_range(0,2)].instantiate()
	hero_instance.global_position = spawn_point_array[rng.randi_range(0,2)]
	add_child(hero_instance)


func _on_area_2d_body_entered(body):
	if(body.type == "hero"):
		body.escape()


func _on_money_update(amount):
	print("signal")
	$RoomPurchasingMenu.currentGold += amount


func _on_timer_timeout():
	spawn_hero()
