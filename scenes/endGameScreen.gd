extends Node2D

func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/startMenu.tscn")

func _ready():
	$StatsPanel/EnemiesKilled.text = "You only killed " + str(get_node("/root/ScoreboardData").killCount) + " enemies."

func _on_quit_pressed():
	get_tree().quit()
