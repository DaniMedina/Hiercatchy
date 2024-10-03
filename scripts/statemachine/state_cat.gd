class_name CatState extends State

@export var actor: Node2D
@onready var animated_sprite = actor.get_node("AnimatedSprite2D")

func Input_update(_event: InputEvent):
	if _event is InputEventMouseButton && actor.on_focus:
		if _event.is_action_pressed("action"):
			manageState()				
	pass

func manageState():
	match(name):
		'IdleState': transitioned.emit('GetUpState')
		'GetUpState': pass
		'StandState': pass
		'JumpState': pass
		'OnTowerState': pass
	pass
