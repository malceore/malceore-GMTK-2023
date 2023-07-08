extends Node2D

var monster = preload("res://scenes/monster.tscn")

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_button_pressed():
	var monster_instance = monster.instantiate()
	add_child(monster_instance)
