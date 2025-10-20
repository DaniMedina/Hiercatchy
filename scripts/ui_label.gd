extends Label 

@export var is_back: bool = false
@export var tick_time: float = 0.5
@export var offset_mod: float = 2.0

var ui_shadow: UI_Shadow

# Called when the node enters the scene tree for the first time.
func _ready():
	if (is_back): ui_shadow = UI_Shadow.new(self, is_back, tick_time, offset_mod)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func turn_small():
	var theme_modifier = "_Small_Shadow" if is_back else "_Small"
	theme_type_variation = _clean_theme(theme_type_variation)+theme_modifier
	pass

func _clean_theme(theme_name: String):
	var pos = theme_name.find("_Shadow")
	return theme_name.erase(pos,99) if pos >= 0 else theme_name
