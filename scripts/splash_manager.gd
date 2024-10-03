extends Control

@export var move_to: PackedScene
@export var initial_delay: float = 1

var splash_screens: Array[SplashScreen] = []

@onready var splash_screen_container: CenterContainer = $SplashScreenContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(move_to)	
	set_process_input(false)
	
	for splash_screen in splash_screen_container.get_children():
		splash_screen.hide()
		splash_screens.push_back(splash_screen)
	
	await get_tree().create_timer(initial_delay).timeout

	start_splash_screen()
	
	set_process_input(true)
	pass # Replace with function body.

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("splash_skip") || _event is InputEventScreenTouch && _event.is_pressed():
		skip()
	pass

func start_splash_screen():
	if splash_screens.size() == 0:
		get_tree().change_scene_to_packed(move_to)
	else:
		var splash_screen: SplashScreen = splash_screens.pop_front()
		splash_screen.start()
		splash_screen.connect("finished",start_splash_screen)
	pass
	
func skip():
	splash_screen_container.get_child(0).queue_free()
	start_splash_screen()
	pass
