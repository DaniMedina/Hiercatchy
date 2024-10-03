class_name State extends Node

signal transitioned(new_state_name: StringName)

func Enter(_previous_state: State) -> void:
	pass

func Exit() -> void:
	pass

func Update(_delta: float) -> void:
	pass

func Input_update(_event: InputEvent) -> void:
	pass

func Physics_update(_delta: float) -> void:
	pass
