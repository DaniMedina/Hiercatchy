extends Timer

@export var timeout_min: float = 15.0
@export var timeout_max: float = 35.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func initialize():
	wait_time = randf_range(timeout_min, timeout_max)

func _on_timeout():
	initialize()
	pass # Replace with function body.
