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
		self.add_child(heldRoom)
		areas[name] = heldRoom
		heldRoom.position = self.find_child(name).find_child("CollisionShape2D").position
		areas[name] = heldRoom
		self.get_parent().heldRoom = null
		self.get_parent().holdingRoom = false

func _on_area_1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		_on_area_clicked(event, "Area1")
