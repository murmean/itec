extends CharacterBody2D
class_name Player

const JUMP_VELOCITY = -400.0

@export var movement_speed = 400


@onready var interaction_area: InteractionArea =  $InteractionArea


# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):


	
	var x_dir = Input.get_action_strength("right") -	Input.get_action_strength("left")
	var y_dir = Input.get_action_strength("down") -	Input.get_action_strength("up")
	var mov = Vector2(x_dir,y_dir)
	velocity = mov.normalized() * movement_speed

	move_and_slide()

