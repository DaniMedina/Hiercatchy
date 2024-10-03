extends Node2D

signal is_prepared

enum TypesEnum {A, B, C, D}

#var types: Array[String] = ["A","B","C","D"]#,"E","F"]
#var type: String = types[randi_range(0,types.size()-1)]
var stand_offset: Vector2 = Vector2(0,-30)
var target: Node2D = null
var on_focus: bool = false

@export var type_index: TypesEnum
@export var scares: Array[Node2D] = []
@export_range(5.0,15.0) var jump_speed: float

@onready var type: String = TypesEnum.keys()[type_index]
@onready var original_position: Vector2 = global_position
@onready var target_position: Vector2 = original_position
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.prepared_cat_changed.connect(_on_prepared_cat_change)
	animated_sprite.frame = randi_range(0, animated_sprite.sprite_frames.get_frame_count("idle_"+type))
	animated_sprite.flip_h = bool(randi_range(0,1))
	$StateMachine.start_machine()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = lerp(global_position, target_position, _delta * jump_speed)
	#if !is_moving():
		#if $StateMachine.current_state.name == 'JumpState': $StateMachine.current_state.transitioned.emit("OnTowerState")
		#elif $StateMachine.current_state.name == 'ScaredState': $StateMachine.current_state.transitioned.emit("GetDownState")
	pass
	
func _input(_event):
	if on_focus && Input.is_action_just_pressed("action"):
		prepare_cat()
		pass
	pass

func _on_area_2d_mouse_shape_entered(_shape_idx):
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	on_focus = true
	pass # Replace with function body.

func _on_area_2d_mouse_shape_exited(_shape_idx):
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	on_focus = false
	pass # Replace with function body.

func scare():
	if target != null: $StateMachine.current_state.transitioned.emit('ScaredState')
	pass

func jump(new_target: Node2D):
	target = new_target
	target_position = new_target.global_position+stand_offset
	$StateMachine.current_state.transitioned.emit('JumpState')
	if scares.size() > 0:
		for scared in scares:
			if scared != null:
				for spot in target.affected_spots:
					if scared.target == spot: scared.scare()
	pass

func is_on_original_position() -> bool:
	return is_equal_approx(global_position.x, original_position.x) && is_equal_approx(global_position.y, original_position.y)

func is_moving() -> bool:
	return !is_equal_approx(global_position.x, target_position.x) || !is_equal_approx(global_position.y, target_position.y)

func _on_prepared_cat_change():
	if $StateMachine.current_state.name == 'StandState':
		$StateMachine.current_state.transitioned.emit('GetDownState')

func prepare_cat():
	if $StateMachine.previous_state != null && $StateMachine.current_state.name == 'OnTowerState':
			if Global.prepared_cat == self: Global.change_prepared_cat(null)
			scare()
	pass


func _on_touch_screen_button_pressed():
	$StateMachine.current_state.manageState()
	prepare_cat()
	pass # Replace with function body.
