extends Node2D

var placeHolderRoom = preload("res://scenes/room.tscn")

@export var currentGold = 10
@export var costsOfSlots = [1, 3, 5, 0, 0, 0]
var slots = {}
var holdingRoom = false
var heldRoom = null

func _ready():
	# Gather up the slots, tying names to costs. Also set label costs
	var slotCount = 0
	for child in self.get_children():
		if "Slot" in child.name:
			if costsOfSlots[slotCount] != 0:
				child.find_child("CostLabel").text = str(costsOfSlots[slotCount]) + " GP"
			else:
				child.find_child("CostLabel").text = " " 
			slots[child.name] = costsOfSlots[slotCount]
			slotCount += 1	
	$GoldLabel.text = str(currentGold) + " GP"

func _process(delta):
	$GoldLabel.text = str(currentGold) + " GP"
	if holdingRoom:
		heldRoom.global_position = get_global_mouse_position()

func _on_slot_clicked(event, name):
	if currentGold >= slots[name] and (currentGold - slots[name]) > 0:
		currentGold -= slots[name]
		heldRoom = placeHolderRoom.instantiate()
		add_child(heldRoom)
		holdingRoom = true

func _on_slot_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot1")
func _on_slot_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot2")
func _on_slot_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_slot_clicked(event, "Slot2")