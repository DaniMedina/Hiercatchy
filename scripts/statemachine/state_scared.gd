class_name ScaredState extends CatState

func Enter(_previous_state):
	actor.target_position = actor.original_position
	actor.target.is_filled = false
	actor.target.spot_emptied.emit()
	actor.target = null
	animated_sprite.speed_scale = 2
	animated_sprite.animation_finished.connect(_on_scared_finished)
	animated_sprite.play("scared_"+actor.type)

func Exit():
	if animated_sprite.animation_finished.is_connected(_on_scared_finished): animated_sprite.animation_finished.disconnect(_on_scared_finished)
	animated_sprite.speed_scale = 1
	pass

func _on_scared_finished():
	transitioned.emit("GetDownState")
	pass
