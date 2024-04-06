extends CharacterBody2D

@export var path: PathFinding
const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var player : Player
@export var enemy : CharacterBody2D

func _physics_process(delta):
	


	move_and_slide()
