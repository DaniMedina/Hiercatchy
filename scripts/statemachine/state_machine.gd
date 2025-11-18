class_name StateMachine extends Node

@export var actor: Node2D
@export var current_state: State
var previous_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.set_actor(actor)
			child.transitioned.connect(on_child_transitioned)
		else:
			push_warning("State machine contains child which is not 'State: "+child.name)
	
func _proces(delta):
	current_state.Update(delta)

func _input(event):
	current_state.Input_update(event)

func on_child_transitioned(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != current_state:
			previous_state = current_state
			current_state.Exit()
			new_state.Enter(previous_state)
			current_state = new_state
	else:
		push_warning("Called transition on a state that does not exist")

func start_machine():
	current_state.Enter(current_state)
