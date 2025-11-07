extends Node2D

signal spot_filled
signal spot_emptied
signal spot_selected

@export var affected_spots: Array[Node2D] = []

var is_filled: bool = false
var on_focus: bool = false
var prepared_cat: Node2D = null
var actual_cat: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = randi_range(0, $AnimatedSprite2D.sprite_frames.get_frame_count("idle"))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _input(_event):
	if on_focus && Input.is_action_just_pressed("action"):
		#jump_cat()
		spot_selected.emit(self)
	pass

func set_prepared_cat(cat: Node2D):
	if !is_filled: Global.change_prepared_cat(cat)
	pass

func _on_area_2d_mouse_entered():
	if !is_filled: 
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		on_focus = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	on_focus = false
	pass # Replace with function body.

func jump_cat():
	if !is_filled && Global.prepared_cat != null:
		is_filled = true
		spot_filled.emit()
		actual_cat = Global.prepared_cat
		Global.change_prepared_cat(null)
		actual_cat.jump(self)
	pass
