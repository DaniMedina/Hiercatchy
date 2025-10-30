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
		child.spot_filled.connect(add_filled_spot)
		child.spot_emptied.connect(substract_filled_spot)
	for child in $Cats.get_children():
		child.find_child('Cat').is_prepared.connect(_on_cat_is_prepared)
		child.find_child('Cat').trait_has_finished.connect(start_traits_timer)
		child.find_child('Cat').ready_to_trait.connect(check_traits_timer)
	
	if (active_traits):
		$TraitsTimer.initialize()
		start_traits_timer()
	
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

func start_traits_timer():
	if len(get_trait_ready_cats()) > 0:
		$TraitsTimer.start()

func check_traits_timer():
	if $TraitsTimer.is_stopped(): start_traits_timer()

func _on_traits_timer_timeout():
	var trait_ready_cats = get_trait_ready_cats()
	if len(trait_ready_cats) > 0:
		var random_child = randi_range(0, len(trait_ready_cats)-1)
		var cat = trait_ready_cats[random_child]
		print("Trait triggered!")
		
		var index = randi_range(0,len(cat.traits_active)-1)
		match(cat.traits_active[index]):
			'playfull':
				print("IS PLAYFULL")
				pass
			'restless':
				print("IS RESTLESS")
				var free_spot = get_random_free_spot()
				cat.restless(free_spot)
		#cat.trigger_active_trait()
	pass

func get_trait_ready_cats():
	var cats = []
	for child in $Cats.get_children():
		if child.get_node('Cat').is_ready_to_trait:
			cats.push_back(child.get_node('Cat'))
	return cats
	
func get_random_free_spot():
	var spots = []
	for child in $Spots.get_children():
		if !child.is_filled: spots.push_back(child)
	return spots[randi_range(0, len(spots)-1)] if len(spots) > 0 else 0
