extends Control

@export var next_level: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_next_button_pressed():
	if next_level != null: get_tree().change_scene_to_packed(next_level)
	pass # Replace with function body.


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_packed(Global.menu_scene)
	pass # Replace with function body.

func spawn():
	if !visible:
		visible = true
		$CorrectSound.play()
