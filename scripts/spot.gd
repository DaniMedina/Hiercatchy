extends Node2D

signal selected

var current_cat: Node2D
var is_filled: bool = false
var on_focus: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Checks the input event
func _input(_event):
	# If the spot is focused and the action 'action' pressed, emits the selected signal
	if on_focus && Input.is_action_just_pressed("action"):
		selected.emit(self)
	pass

#### SIGNALS #######################################################################################

# Marks the spot as focused and change the cursor
func _on_area_2d_mouse_entered():
	if !is_filled: 
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		on_focus = true
	pass

# Marks the spot as unfocused and change the cursor
func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	on_focus = false
	pass

#### CUSTOM FUNCTIONS ##############################################################################
# Sets if the spot is filled or not
func set_filled(state: bool):
	is_filled = state
	pass
