class_name SplashScreen extends Control

@export var time: float = 3
@export var fade_time: float = 1

signal finished()

func start() -> void:
	modulate.a = 0
	show()
	
	var tween: Tween = create_tween()
	tween.connect("finished", finish)
	tween.tween_property(self,"modulate:a",1,fade_time)
	tween.tween_interval(time)
	tween.tween_property(self,"modulate:a",0,fade_time)
	pass
	
func finish() -> void:
	emit_signal("finished")
	queue_free()
	pass
