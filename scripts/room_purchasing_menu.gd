extends Node2D

@export var currentGold = 10
@export var costsAndContentsOfSlots = [
	{"cost": 8, "room": "crypt"}, 
	{"cost": 12, "room": "cave"}, 
	{"cost": 6, "room": "tower"}, 
	{"cost": 1, "room": "spider nest"}, 
	{"cost": 2, "room": "labyrinth"}, 
	{"cost": 2, "room": "gold mine"}
]
var rooms = {
	"default": preload("res://scenes/room.tscn"),
	"cave": preload("res://scenes/cave.tscn"),
	"crypt": preload("res://scenes/crypt.tscn"),
	"tower": preload("res://scenes/tower.tscn"),
	"spider nest": preload("res://scenes/spider_nest.tscn"),
	"gold mine": preload("res://scenes/gold_mine.tscn"),
	"labyrinth": preload("res://scenes/gold_mine.tscn")
}
var slots = {}

func _ready():
	# Gather up the slots, tying names to costs. Also set label costs
	var slotCount = 0
	for child in self.get_children():
		if "Slot" in child.name:
			if costsAndContentsOfSlots[slotCount].cost != 0:
				child.find_child("CostLabel").text = str(costsAndContentsOfSlots[slotCount].cost) + " GP"
			else:
				child.find_child("CostLabel").text = " " 
			slots[child.name] = costsAndContentsOfSlots[slotCount]
			slotCount += 1
	$GoldLabel.text = str(currentGold) + " GP"

func _process(delta):
	$GoldLabel.text = str(currentGold) + " GP"
	if self.get_parent().holdingRoom:
		self.get_parent().heldRoom.global_position = get_global_mouse_position()

func _on_slot_clicked(event, name):
	if currentGold >= slots[name].cost and (currentGold - slots[name].cost) > 0:
		currentGold -= slots[name].cost
		self.get_parent().heldRoom = rooms[slots[name].room].instantiate()
		self.get_parent().add_child(self.get_parent().heldRoom)
		self.get_parent().holdingRoom = true
	else:
		$noMoney.play()

func _on_slot_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot1")
func _on_slot_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot2")
func _on_slot_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot3")
func _on_slot_4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot4")
func _on_slot_5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot5")
func _on_slot_6_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot6")
