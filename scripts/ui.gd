extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$PauseMenu.visible = false
	$LevelCleared.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Opens the level cleared menu
func _on_level_cleared():
	$LevelCleared.spawn()
	pass # Replace with function body.

# Opens the pause menu
func _on_level_pause():
	$PauseMenu.visible = true
	pass # Replace with function body.

# Resumes the game
func _on_pause_menu_unpause():
	get_tree().paused = false
	pass # Replace with function body.
