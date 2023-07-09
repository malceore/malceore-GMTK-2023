extends Node2D

@export var startingGold = 0
@export var heroRate = 3
@export var numberOfRows = 2
@export var levelTime = 90
@onready var spawn_point_array = []

func countdown():
	levelTime -= 1
	$LevelTimer.text = "Time left \n" + str(levelTime)
	if levelTime == 0:
		print("TimeStop")

var hero_array = [preload("res://scenes/fighter.tscn"),
				  preload("res://scenes/mage.tscn"),
				  preload("res://scenes/rogue.tscn")]
signal money_update(amount)
var rng = RandomNumberGenerator.new()
var heldRoom = null
var holdingRoom = false

func _ready():
	# Iterate over and disable rows not needed.
	for child in self.get_children():
		if "Row" in child.name and numberOfRows > 0:
			child.visible = true
			spawn_point_array.append(child.find_child("hero_spawner").global_position)
			numberOfRows -= 1

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
	$Timer.start()

func _on_button_pressed():
	startHeroWave()
	
func _on_delay_timer_timeout():
	startHeroWave()

func _on_timer_timeout():
	$Popup.hide()
	var hero_instance = hero_array[rng.randi_range(0,2)].instantiate()
	var spawner_count = spawn_point_array.size() - 1
	hero_instance.global_position = spawn_point_array[rng.randi_range(0,spawner_count)]
	hero_instance.get_node("Sprite2D").position.y += rng.randi_range(-20,20)
	add_child(hero_instance)

func _on_area_2d_body_entered(body):
	if(body.type == "hero"):
		body.escape()
		
func _on_money_update(amount):
	$RoomPurchasingMenu.currentGold += amount
	if($RoomPurchasingMenu.currentGold < 1):
		get_tree().change_scene_to_file("res://scenes/endGameScreen.tscn")

func _on_monster_cleaner_body_entered(body):
	if(body.type == "monster"):
		body.queue_free()


