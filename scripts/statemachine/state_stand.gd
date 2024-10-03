class_name StandState extends CatState

func Enter(_previous_state: State):
	animated_sprite.play("stand_"+actor.type)
	
func Input_update(_event):
	if _event is InputEventMouseMotion:
		actor.animated_sprite.flip_h = actor.position.x > _event.position.x
