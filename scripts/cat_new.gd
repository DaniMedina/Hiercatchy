extends Node2D

signal is_getting_up

var on_focus: bool = false
var stand_offset: Vector2 = Vector2(0,-30)
var target: Node2D = null

@export var type_index: int
@export_range(5.0,15.0) var jump_speed: float

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var original_position: Vector2 = global_position
@onready var target_position: Vector2 = original_position
@onready var type: String = CatInfo.types.keys()[type_index]

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_cat()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (!global_position.is_equal_approx(target_position)):
		global_position = lerp(global_position, target_position, _delta * jump_speed)
	if Global.test: $Label.text = $StateMachine.current_state.name
	pass

##### SIGNALS ######################################################################################

func _on_area_2d_mouse_shape_entered(_shape_idx):
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	on_focus = true
	pass # Replace with function body.

#
func _on_area_2d_mouse_shape_exited(_shape_idx):
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	on_focus = false
	pass # Replace with function body.

##### CUSTOM FUNCTIONS #############################################################################
func checkFlip():
	animated_sprite.flip_h =  !global_position.x < get_global_mouse_position().x
	pass

func reset_cat():
	if (type_index == 0):
		type_index = randi_range(1,CatInfo.types.size()-1)
	type = CatInfo.types.keys()[type_index]
	
	animated_sprite.frame = randi_range(0, animated_sprite.sprite_frames.get_frame_count("idle_"+type))
	animated_sprite.flip_h = bool(randi_range(0,1))
	$StateMachine.start_machine()
	pass
	
func set_target(new_target):
	if $StateMachine.current_state.name == "StandState":
		target = new_target
		$StateMachine.current_state.manageState()

func set_target_position():
	target_position = target.global_position+stand_offset
	pass
