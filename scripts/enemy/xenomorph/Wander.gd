extends State

@export var enemy: CharacterBody2D
@export var move_speed = 50
@onready var reaction_time = $"../../pathfinding/ReactionTime"

var move_direction: Vector2
var wander_time : float
var player : CharacterBody2D

func enter():
	if get_tree() != null:
		player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	reaction_time.stop()
	
func physics_update(delta):
	if enemy:
		enemy.velocity = move_direction * move_speed
	
	
		
func randomize_wander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
	

	
func update(delta):
	if enemy.velocity.x != 0:
		%AnimatedSprite2D.play("run")
	if wander_time > 0:
		wander_time -= get_process_delta_time()
	else:
		randomize_wander()
	




func _on_detection_area_body_entered(body):
		Transitioned.emit(self,"Follow")
