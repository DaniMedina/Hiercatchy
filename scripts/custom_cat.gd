extends Node2D

@export var type_index: CatInfo.types
@export var traits_index: Array[CatInfo.traits] = []
@export var scares: Array[Node2D] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cat.type_index = type_index
	$Cat.traits_index = traits_index
	$Cat.scares = scares
	$Cat.reset_cat()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
