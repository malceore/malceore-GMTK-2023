extends Node2D

var areas = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in self.get_children():
		if "Area" in child.name:
			areas[child.name] = null

func _on_area_clicked(event, name):
	if areas[name] == null and self.get_parent().heldRoom != null:
		var heldRoom = self.get_parent().heldRoom
		self.get_parent().remove_child(heldRoom)
		self.find_child(name).add_child(heldRoom)
		areas[name] = heldRoom
		heldRoom.enable()
		heldRoom.position = self.find_child(name).find_child("CollisionShape2D").position
		self.get_parent().heldRoom = null
		self.get_parent().holdingRoom = false

func _on_area_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area1")
func _on_area_2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area2")
func _on_area_3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area3")
func _on_area_4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area4")
func _on_area_5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area5")
func _on_area_6_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area6")
func _on_area_7_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area7")
