class_name RestlessState extends CatState

func Enter(_previous_state: State):
	animated_sprite.animation_finished.connect(_on_restless_finished)
	animated_sprite.play("restless_"+actor.type)

func Exit():
	if animated_sprite.animation_finished.is_connected(_on_restless_finished): animated_sprite.animation_finished.disconnect(_on_restless_finished)
	pass

func _on_restless_finished():
	transitioned.emit("JumpState")
