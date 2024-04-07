extends CharacterBody2D


@export var enemy : CharacterBody2D
@export var path: PathFinding
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var animPlayer = %AnimationPlayer
@onready var collision_shape_2d = $Project/StrikeArea/CollisionShape2D
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var enemy_attack = %EnemyAttack
var player_detected = null




func _ready():
	collision_shape_2d.set_deferred("disabled",true)
	%AnimatedSprite2D.rotation_degrees = 260
	Signals.found_player.connect(_player_detected)
	Signals.lost_player.connect(_not_player)
func _physics_process(delta):
	if player_detected:
		%Project.look_at(player.global_position)
	move_and_slide()
	
func _not_player():
	player_detected = null


func _player_detected():
	player_detected = true


func _on_attack_area_body_entered(body):
	if body.is_in_group("Player"):
		animPlayer.play("thrust")
		


func _on_strike_area_body_entered(body):
	if body.is_in_group("Player"):
		body.die()

func _activate_strikebox():
	collision_shape_2d.set_deferred("disabled",false)
	await get_tree().create_timer(0.3).timeout
	collision_shape_2d.set_deferred("disabled",true)

func play_stab():
	enemy_attack.play()
