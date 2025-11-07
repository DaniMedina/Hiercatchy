class_name RestlessState extends CatState

var max_times: int = 5
var times: int = 0

func Enter(_previous_state: State):
	times = 0
	CatEffects.play_random_purr()
	animated_sprite.animation_finished.connect(_on_restless_finished)
	start_animation()

func Exit():
	if CatEffects.is_playing(): CatEffects.stop()
	if animated_sprite.animation_finished.is_connected(_on_restless_finished): animated_sprite.animation_finished.disconnect(_on_restless_finished)
	pass

func start_animation():
	animated_sprite.play("restless_"+actor.type)
	times += 1

func _on_restless_finished():
	if times < max_times:
		start_animation()
	else:
		transitioned.emit("ScaredState")

