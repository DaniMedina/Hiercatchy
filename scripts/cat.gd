extends Node2D

signal is_prepared

var stand_offset: Vector2 = Vector2(0,-30)
var target: Node2D = null
var on_focus: bool = false

@export var type_index: CatInfo.types
@export var traits_index: Array[CatInfo.traits] = []
@export var scares: Array[Node2D] = []
@export_range(5.0,15.0) var jump_speed: float
@export var traits_min_delay: float = 10.0
@export var traits_max_delay: float = 35.0

@onready var type: String = CatInfo.types.keys()[type_index]
@onready var traits: Array[String] = []
@onready var original_position: Vector2 = global_position
@onready var target_position: Vector2 = original_position
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.prepared_cat_changed.connect(_on_prepared_cat_change)
	setup_behaviours(traits_index)
	reset_cat()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = lerp(global_position, target_position, _delta * jump_speed)
	
	#trigger_behaviour(traits_index)
	
	if $StateMachine.current_state.name == 'StandState':
		checkFlip()
		checkTraitsTriggers()
		
	#if !is_moving():
		#if $StateMachine.current_state.name == 'JumpState': $StateMachine.current_state.transitioned.emit("OnTowerState")
		#elif $StateMachine.current_state.name == 'ScaredState': $StateMachine.current_state.transitioned.emit("GetDownState")
	pass
	
func _input(_event):
	if on_focus && Input.is_action_just_pressed("action"):
		prepare_cat()
		pass
	pass

# Signal events

#
func _on_area_2d_mouse_shape_entered(_shape_idx):
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	on_focus = true
	pass # Replace with function body.

#
func _on_area_2d_mouse_shape_exited(_shape_idx):
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	on_focus = false
	pass # Replace with function body.

#
func _on_prepared_cat_change():
	if $StateMachine.current_state.name == 'StandState':
		$StateMachine.current_state.transitioned.emit('GetDownState')

#
func _on_touch_screen_button_pressed():
	$StateMachine.current_state.manageState()
	prepare_cat()
	pass # Replace with function body.

# Functions

#
func checkFlip():
	animated_sprite.flip_h =  !global_position.x < get_global_mouse_position().x
	pass

func checkTraitsTriggers():
	print($Timer.wait_time)
	pass
# 
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

#
func is_on_original_position() -> bool:
	return is_equal_approx(global_position.x, original_position.x) && is_equal_approx(global_position.y, original_position.y)

#
func is_moving() -> bool:
	return !is_equal_approx(global_position.x, target_position.x) || !is_equal_approx(global_position.y, target_position.y)

#
func prepare_cat():
	if $StateMachine.previous_state != null && $StateMachine.current_state.name == 'OnTowerState':
			if Global.prepared_cat == self: Global.change_prepared_cat(null)
			scare()
	pass

#
func reset_cat():
	if (type_index == 0):
		type_index = randi_range(1,CatInfo.types.size()-1)
	type = CatInfo.types.keys()[type_index]
	for i in traits_index: traits.push_front(CatInfo.traits.keys()[i])
	animated_sprite.frame = randi_range(0, animated_sprite.sprite_frames.get_frame_count("idle_"+type))
	animated_sprite.flip_h = bool(randi_range(0,1))
	$StateMachine.start_machine()
	pass

#
func scare():
	if target != null: $StateMachine.current_state.transitioned.emit('ScaredState')
	pass
	
func setup_behaviours(behaviours: Array[CatInfo.traits] = [CatInfo.traits.standard]):
	for behaviour in behaviours:
		match CatInfo.traits.find_key(behaviour):
			"playful":
				var playful_timer = Timer.new()
				playful_timer.autostart = false
				playful_timer.wait_time = randf_range(traits_min_delay, traits_max_delay)
				playful_timer.timeout.connect(_on_timer_timeout.bind(CatInfo.traits.find_key(behaviour)))
				add_child(playful_timer, true)
				print('Is '+CatInfo.traits.find_key(behaviour))
			"restless":
				print('Is '+CatInfo.traits.find_key(behaviour))
			"revolutionary":
				print('Is '+CatInfo.traits.find_key(behaviour))
			"troubled_past":
				print('Has '+CatInfo.traits.find_key(behaviour))
			"vertigo":
				print('Has '+CatInfo.traits.find_key(behaviour))
	pass

func trigger_behaviour(behaviours: Array[CatInfo.traits] = [CatInfo.traits.standard]):
	for behaviour in behaviours:
		print(behaviour)
		print(CatInfo.traits.find_key(behaviour))
	pass
	
func _on_timer_timeout(behaviour: String):
	print("Trigger "+ behaviour)
	pass

