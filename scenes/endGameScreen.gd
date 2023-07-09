extends Node2D

var levelToLoad

func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/level_" + levelToLoad + ".tscn")

func _ready():
	$StatsPanel/EnemiesKilled.text = "You killed " + str(get_node("/root/ScoreboardData").killCount) + " enemies."
	get_node("/root/ScoreboardData").killCount = 0
	levelToLoad = str(get_node("/root/ScoreboardData").retryLevel)

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/startMenu.tscn")
