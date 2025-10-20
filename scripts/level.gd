class_name Level extends Node2D

signal level_cleared
signal pause

@onready var total_spots: int = $Spots.get_child_count()
var filled_spots: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play_music_level()
	for child in $Spots.get_children():
		child.spot_filled.connect(add_filled_spot)
		child.spot_emptied.connect(substract_filled_spot)
	for child in $Cats.get_children():
		child.find_child('Cat').is_prepared.connect(_on_cat_is_prepared)
	get_tree().paused = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_arrow_tutorial()
	if filled_spots == total_spots:
		level_cleared.emit()
	pass

func _input(_event):
	if _event.is_action_pressed("pause"):
		start_pause()

func _on_cat_is_prepared(cat: Node2D):
	for child in $Spots.get_children(): child.set_prepared_cat(cat)
	pass # Replace with function body.

func _on_spot_emptied():
	substract_filled_spot()
	pass #

func _on_spot_filled():
	add_filled_spot()
	pass # Replace with function body.

func add_filled_spot():
	filled_spots += 1
	pass
	
func substract_filled_spot():
	filled_spots -= 1
	pass

func check_arrow_tutorial():
	pass


func _on_level_cleared():
	pass # Replace with function body.


func _on_pause():
	pass # Replace with function body.

func start_pause():
	get_tree().paused = true
	pause.emit()
