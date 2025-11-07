extends Node2D

@export var type_index: CatInfo.types
@export var active_traits_index: Array[CatInfo.traits_active] = []
@export var passive_traits_index: Array[CatInfo.traits_passive] = []
@export var scares: Array[Node2D] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cat.type_index = type_index
	$Cat.active_traits_index = active_traits_index
	$Cat.passive_traits_index = passive_traits_index
	$Cat.scares = scares
	$Cat.reset_cat()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
