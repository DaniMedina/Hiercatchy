extends Button

enum TypesEnum {Start, Exit, Continue, Back, MainMenu, NextLevel, Tutorial, Level1, Level2, Level3, Level4, Level5, Pause}
var TypesDesc: Array[String] = ['Start', 'Exit', 'Continue', 'Back', 'Main menu', 'Next level', 'Tutorial', 'Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5', 'II']
@export var type: TypesEnum
@export var is_small: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	for node in $Texts/Label.get_children():
		node.text = TypesDesc[type]
		if (is_small): node.turn_small()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mouse_entered():
	modulate = Color('#d2d2d2')
	pass # Replace with function body.


func _on_mouse_exited():
	modulate = Color('#ffffff')
	pass # Replace with function body.


func _on_pressed():
	ClickSound.play_effect()
	pass # Replace with function body.


func _on_touch_screen_button_pressed():
	pressed.emit()
	pass # Replace with function body.
