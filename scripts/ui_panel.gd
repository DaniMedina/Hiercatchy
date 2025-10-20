extends ColorRect 

@export var main_color: Color = Global.ui_main_color
@export var secondary_color: Color = Global.ui_secondary_color
@export var back_color: Color = Global.ui_back_color
@export var is_button: bool = false
@export var is_back: bool = false
@export var tick_time: float = 0.5
@export var offset_mod: float = 2.0

var ui_shadow: UI_Shadow

# Called when the node enters the scene tree for the first time.
func _ready():
	color = back_color if is_back else main_color if is_button else secondary_color
	if (is_back): ui_shadow = UI_Shadow.new(self, is_back, tick_time, offset_mod)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
