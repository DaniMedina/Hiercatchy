class_name OnTowerState extends CatState

func Enter(_previous_state: State):
	actor.set_ready_to_trait(true)
	animated_sprite.play("stand_"+actor.type)
