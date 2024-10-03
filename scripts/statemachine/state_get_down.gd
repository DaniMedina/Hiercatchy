class_name GetDownState extends CatState

func Enter(_previous_state: State):
	if _previous_state.name == 'StandState':
		animated_sprite.animation_finished.connect(_on_getup_reversed_finished)
		animated_sprite.play_backwards("getup_"+actor.type)
	elif _previous_state.name == 'ScaredState':
		animated_sprite.animation_finished.connect(_on_getdown_finished)
		animated_sprite.play("getdown_"+actor.type)

func Exit():
	if animated_sprite.animation_finished.is_connected(_on_getdown_finished): animated_sprite.animation_finished.disconnect(_on_getdown_finished)
	if animated_sprite.animation_finished.is_connected(_on_getup_reversed_finished): animated_sprite.animation_finished.disconnect(_on_getup_reversed_finished)

func _on_getdown_finished():
	transitioned.emit("IdleState")
	pass

func _on_getup_reversed_finished():
	transitioned.emit("IdleState")
	pass
