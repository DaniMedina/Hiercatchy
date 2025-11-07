class_name PlayFrontState extends CatState

func Enter(_previous_state: State):
	animated_sprite.animation_finished.connect(_on_playfront_finished)
	animated_sprite.play("playfront_"+actor.type)

func Exit():
	if animated_sprite.animation_finished.is_connected(_on_playfront_finished): animated_sprite.animation_finished.disconnect(_on_playfront_finished)
	pass

func _on_playfront_finished():
	print(actor.current_trait)
	match(actor.current_trait):
		'restless':
			transitioned.emit("RestlessState")
			pass
	
