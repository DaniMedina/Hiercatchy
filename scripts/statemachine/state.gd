class_name State extends Node

signal transitioned(new_state_name: StringName)

# When state is entered
func Enter(_previous_state: State) -> void:
	pass
	
# When state is exited
func Exit() -> void:
	pass

# When the current frame is loaded
func Update(_delta: float) -> void:
	pass

# When an input event occurs
func Input_update(_event: InputEvent) -> void:
	pass

# When physics are updated
func Physics_update(_delta: float) -> void:
	pass
