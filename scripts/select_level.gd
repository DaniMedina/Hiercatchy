extends Control

@export var levels: Array[PackedScene] = []
@export var tutorial_level: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_back_pressed():
	visible = false
	pass # Replace with function body.


func _on_level_pressed(index: int):
	if index == 99: get_tree().change_scene_to_packed(tutorial_level)
	elif levels.size() > index: get_tree().change_scene_to_packed(levels[index])
	pass # Replace with function body.
