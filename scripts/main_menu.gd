extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play_music_level()
	$SelectLevel.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_button_pressed():
	$SelectLevel.visible = true
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
