extends Node2D


var monsters = {
	"zombie": preload("res://scenes/zombie.tscn"),
	"troll": preload("res://scenes/troll.tscn"),
	"bolt": preload("res://scenes/bolt.tscn")
}

@export var cost = 10
@export var secondsBetweenInterval = 0
var enabled = false

func enable():
	enabled = true
	if secondsBetweenInterval > 0:
		$Timer.wait_time = secondsBetweenInterval
		$Timer.start()

func _on_timer_timeout() -> void:
	if enabled:
		timedAffect()

func timedAffect():
	if name == "crypt":
		var monster = monsters["zombie"].instantiate()
		self.get_parent().get_parent().add_child(monster)
		monster.global_position = global_position
	if name == "cave":		
		var monster = monsters["troll"].instantiate()
		self.add_child(monster)
	if name == "tower":
		var projectile = monsters["bolt"].instantiate()
		self.add_child(projectile)
		projectile.fire()

func _on_affect_radius_area_entered(area):
	if enabled:
		pass # Replace with function body.

func _on_affect_radius_area_exited(area):
	if enabled:
		pass # Replace with function body.

