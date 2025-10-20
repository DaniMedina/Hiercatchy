extends Control

@export var text: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var shadow_style: String = ""
	for label in get_children(): 
		shadow_style = ""
		label.text = text
		if (label.is_in_group('shadow')): shadow_style = "_Shadow"
		label.theme_type_variation = theme_type_variation + shadow_style
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
