class_name IdleState extends CatState

func Enter(_previous_state: State):
	if actor.type != "": animated_sprite.play("idle_"+actor.type)
