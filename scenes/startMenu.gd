extends Node2D

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	
func _on_level_2_pressed():	
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")

func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://scenes/level_4.tscn")
