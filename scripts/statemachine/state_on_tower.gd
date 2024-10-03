class_name OnTowerState extends CatState

func Enter(_previous_state: State):
	animated_sprite.play("stand_"+actor.type)
