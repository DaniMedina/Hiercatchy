class_name UI_Shadow extends Control

var parent: Object
var is_back: bool = false
var tick_time: float = 0.5
var offset_mod: float = 2.0
var original_position = global_position
var max_scale = max(scale.x, scale.y)

var offsets: Array[Vector2] = []
var offset_position: int = 0
var timer: Timer = Timer.new()

func _init(obj: Object, back: bool, tick: float, mod: float):
	parent = obj
	original_position = parent.position
	max_scale = max(parent.scale.x,parent.scale.y)
	is_back = back
	tick_time = tick
	offset_mod = mod
	
	_set_offsets()
	_set_timer()
	
	pass
	
func _set_timer():
	if (is_back): 
		timer.connect("timeout", _on_ticking_timer_timeout)
		parent.add_child(timer)
		timer.start(tick_time)
	pass

func _set_offsets():
	#MAX: 0.3 // MIN:-0.15
	offsets.push_front(Vector2(0.0,0.0)*max_scale*offset_mod)
	offsets.push_front(Vector2(0.17,0.12)*max_scale*offset_mod)
	offsets.push_front(Vector2(0.3,-0.12)*max_scale*offset_mod)
	offsets.push_front(Vector2(0.1,0.2)*max_scale*offset_mod)
	offsets.push_front(Vector2(-0.05,0.0)*max_scale*offset_mod)
	offsets.push_front(Vector2(-0.15,0.3)*max_scale*offset_mod)
	offsets.push_front(Vector2(0.23,0.22)*max_scale*offset_mod)
	offsets.push_front(Vector2(0.3,0.05)*max_scale*offset_mod)
	offsets.push_front(Vector2(0.08,-0.15)*max_scale*offset_mod)
	offsets.push_front(Vector2(0.25,0.1)*max_scale*offset_mod)
	pass

func _on_ticking_timer_timeout():
	parent.position = original_position + offsets[offset_position]
	offset_position += 1
	if (offset_position >= offsets.size()): offset_position = 0
	pass # Replace with function body.
