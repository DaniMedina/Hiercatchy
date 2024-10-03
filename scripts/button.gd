extends Button

enum TypesEnum {Start, Exit, Continue, Back, MainMenu, NextLevel, Tutorial, Level1, Level2, Level3, Level4, Level5, Pause}
@export var type: TypesEnum

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play(TypesEnum.keys()[type])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_mouse_entered():
	$AnimatedSprite2D.play(TypesEnum.keys()[type]+"_hover")
	pass # Replace with function body.


func _on_mouse_exited():
	$AnimatedSprite2D.play(TypesEnum.keys()[type])
	pass # Replace with function body.


func _on_pressed():
	ClickSound.play_effect()
	pass # Replace with function body.


func _on_touch_screen_button_pressed():
	pressed.emit()
	pass # Replace with function body.
