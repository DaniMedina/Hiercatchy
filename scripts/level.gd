class_name Level extends Node2D

signal level_cleared
signal pause

@onready var total_spots: int = $Spots.get_child_count()
@export var active_traits: bool = false
var filled_spots: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#Music.play_music_level()
	for child in $Spots.get_children():
		child.selected.connect(change_selected_spot)
		pass
	for child in $Cats.get_children():
		child.find_child('Cat').is_getting_up.connect(_on_cat_is_getting_up)
		pass

	get_tree().paused = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_arrow_tutorial()
	check_filled_spots()
	pass

# Called when an input is received
func _input(_event):
	# Pause the game if action 'pause' is pressed
	if _event.is_action_pressed("pause"):
		start_pause()

#### SIGNALS #######################################################################################

# Triggers get_down state on all cats but the passed one on _cat_
func _on_cat_is_getting_up(cat: Node2D):
	for child in $Cats.get_children():
		if child.get_cat_node() != cat:
			child.get_cat_current_state().get_down_if_stand()
	pass

##### CUSTOM FUNCTIONS #############################################################################

# Sets the selected spot to all cats
func change_selected_spot(spot: Node2D):
	for child in $Cats.get_children():
		child.get_cat_node().set_target(spot)
	pass

# Controls the arrow workflow from the tutorial. Overwritten by tutorial.gd 
func check_arrow_tutorial():
	pass
	
# Checks if all the spots are filled and clears the level
func check_filled_spots():
	if $Spots.get_children().reduce(func(total, spot): return total+1 if spot.is_filled else total,0) == $Spots.get_children().size():
		level_cleared.emit()
	pass

# Pause the game
func start_pause():
	get_tree().paused = true
	pause.emit()
	pass
