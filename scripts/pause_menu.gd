extends Control

signal unpause

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _input(_event):
	if _event.is_action_pressed("pause"): _on_continue_button_pressed()


func _on_exit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_continue_button_pressed():
	visible = false
	unpause.emit()
	pass # Replace with function body.


func _on_main_menu_button_pressed():
	if Global.menu_scene != null: get_tree().change_scene_to_packed(Global.menu_scene)
	pass # Replace with function body.
