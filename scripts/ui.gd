extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$PauseMenu.unpause.connect(_on_pause_menu_unpause)
	$PauseMenu.visible = false
	$LevelCleared.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_level_cleared():
	$LevelCleared.spawn()
	pass # Replace with function body.


func _on_level_pause():
	$PauseMenu.visible = true
	pass # Replace with function body.

func _on_pause_menu_unpause():
	get_tree().paused = false
	pass # Replace with function body.
