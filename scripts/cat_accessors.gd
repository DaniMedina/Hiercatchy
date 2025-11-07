extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

##### CUSTOM FUNCTIONS #############################################################################
func get_cat_node():
	return $Cat
	
func get_cat_current_state():
	return $Cat/StateMachine.current_state
