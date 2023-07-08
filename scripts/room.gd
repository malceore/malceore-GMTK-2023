extends Node2D


var monsters = {
	"zombie": preload("res://scenes/zombie.tscn"),
	"troll": preload("res://scenes/troll.tscn")
}

@export var cost = 10
@export var secondsBetweenInterval = 0
var enabled = false

func _process(delta):
	if enabled and secondsBetweenInterval > 0:
		$Timer.wait_time = secondsBetweenInterval
		$Timer.start()

func _on_timer_timeout() -> void:
	if enabled:
		timedAffect()

func timedAffect():
	if name == "crypt":
		print("Spawn a zombie!")
	if name == "cave":
		print("Spawn a troll!")

func _on_affect_radius_area_entered(area):
	if enabled:
		pass # Replace with function body.

func _on_affect_radius_area_exited(area):
	if enabled:
		pass # Replace with function body.

