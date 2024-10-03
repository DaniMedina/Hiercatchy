class_name GetUpState extends CatState

func Enter(_previous_state: State):
	CatEffects.play_random_fx()
	animated_sprite.animation_finished.connect(_on_getup_finished)
	Global.change_prepared_cat(actor)
	animated_sprite.play("getup_"+actor.type)
	pass

func Exit():
	if animated_sprite.animation_finished.is_connected(_on_getup_finished): animated_sprite.animation_finished.disconnect(_on_getup_finished)
	pass
	
func Input_update(_event):
	if _event is InputEventMouseMotion:
		actor.animated_sprite.flip_h = actor.position.x > _event.position.x
	
func _on_getup_finished():
	transitioned.emit("StandState")
	pass
