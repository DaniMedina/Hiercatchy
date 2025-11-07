class_name JumpState extends CatState

func Enter(_previous_state: State):
	animated_sprite.speed_scale = 2
	animated_sprite.animation_finished.connect(_on_jump_finished)
	animated_sprite.play("jump_"+actor.type)
	actor.set_target_position()
	pass

func Exit():
	if animated_sprite.animation_finished.is_connected(_on_jump_finished): animated_sprite.animation_finished.disconnect(_on_jump_finished)
	animated_sprite.speed_scale = 1
	pass

func _on_jump_finished():
	transitioned.emit("OnTowerState")
	pass
