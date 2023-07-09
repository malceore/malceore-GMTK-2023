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
		self.get_parent().get_parent().add_child(monster)
		monster.scale = Vector2(2,2)
		monster.global_position = global_position
	if name == "tower":
		var projectile = monsters["bolt"].instantiate()
		self.get_parent().get_parent().add_child(projectile)
		projectile.global_position = global_position
		projectile.fire()
	if name == "Gold Mine":
		self.get_parent().get_parent().money_update.emit(5)
		print("Mining!")

func _on_affect_radius_area_entered(area):
	if enabled:
		if name == "Spider Nest" and area.get_parent().get("move_speed") != null:
			area.get_parent().move_speed = area.get_parent().move_speed/2

func _on_affect_radius_area_exited(area):
	if enabled:
		if name == "Spider Nest" and area.get_parent().get("move_speed") != null:
			area.get_parent().move_speed = area.get_parent().move_speed*2

