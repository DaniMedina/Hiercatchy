class_name CatState extends State

@export var actor: Node2D
@onready var animated_sprite = actor.get_node("AnimatedSprite2D")

# Checks the input event
func Input_update(_event: InputEvent):
	if _event is InputEventMouseButton && _event.is_action_pressed("action"):
		manageState()
	pass

# Manages the state flow
func manageState():
	match(name):
		'IdleState': 
			if actor.on_focus: 
				actor.is_getting_up.emit(actor)
				transitioned.emit('GetUpState')
		'GetUpState':
			if actor.on_focus: transitioned.emit('GetDownState')
		'StandState': 
			if actor.on_focus: transitioned.emit('GetDownState')
			elif actor.target != null: transitioned.emit('JumpState')
		'JumpState': pass
		'ScaredState':
			actor.target = null
		'OnTowerState':
			if actor.on_focus: 
				transitioned.emit('ScaredState')
		'GetDownState':
			if actor.on_focus: 
				actor.is_getting_up.emit(actor)
				transitioned.emit('GetUpState')
		'PlayFrontState': 
			if actor.on_focus: transitioned.emit('OnTowerState')
		'RestlessState': 
			if actor.on_focus: transitioned.emit('OnTowerState')
	pass

# Trigger the get down state if standing
func get_down_if_stand():
	match(name):
		'StandState': transitioned.emit('GetDownState')
		'GetUpState': transitioned.emit('GetDownState')
