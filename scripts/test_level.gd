extends Node2D

signal money_update(amount)

var hero = preload("res://scenes/hero.tscn")

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_button_pressed():
	var hero_instance = hero.instantiate()
	add_child(hero_instance)
	hero_instance.take_damage(100)


func _on_area_2d_body_entered(body):
	if(body.type == "hero"):
		body.escape()


func _on_money_update(amount):
	print("signal")
	$RoomPurchasingMenu.currentGold += amount
