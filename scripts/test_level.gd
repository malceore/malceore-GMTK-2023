extends Node2D

@export var startingGold = 0
@export var heroRate = 3
@export var numberOfRows = 2
@onready var spawn_point_array = [$Row1/hero_spawner.global_position,
						 		  $Row2/hero_spawner.global_position,
						 		  $Row3/hero_spawner.global_position]
var hero_array = [preload("res://scenes/fighter.tscn"),
				  preload("res://scenes/mage.tscn"),
				  preload("res://scenes/rogue.tscn")]
signal money_update(amount)
var rng = RandomNumberGenerator.new()
var heldRoom = null
var holdingRoom = false

func _ready():
	$LevelLabel.set_text(self.name)
	$RoomPurchasingMenu.currentGold = startingGold
	# Time it takes for players to read our message
	$DelayTimer.wait_time = 10
	$DelayTimer.one_shot = true
	$DelayTimer.start()

func startHeroWave():
	$HeroWaveTimer.wait_time = heroRate
	$HeroWaveTimer.one_shot = false
	$HeroWaveTimer.start()
	print("waves started")

func _on_button_pressed():
	startHeroWave()

func spawn_hero():
	var hero_instance = hero_array[rng.randi_range(0,2)].instantiate()
	hero_instance.global_position = spawn_point_array[rng.randi_range(0,2)]
	hero_instance.get_node("Sprite2D").position.y += rng.randi_range(-20,20)
	add_child(hero_instance)

func _on_area_2d_body_entered(body):
	if(body.type == "hero"):
		body.escape()
		
func _on_money_update(amount):
	print("signal")
	$RoomPurchasingMenu.currentGold += amount

func _on_timer_timeout():
	spawn_hero()
