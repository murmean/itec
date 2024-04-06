extends State

@export var enemy: CharacterBody2D
@export var move_speed = 50

var player = CharacterBody2D
var move_direction: Vector2
var wander_time : float
func physics_update(delta):
	if enemy:
		enemy.velocity = move_direction * move_speed
	
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 500:
		Transitioned.emit(self,"Follow")

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
	
func enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	
func update(delta):
	if enemy.velocity.x != 0:
		%AnimatedSprite2D.play("run")
	else:
		%AnimatedSprite2D.play("idle")
	if wander_time > 0:
		wander_time -= get_process_delta_time()
	else:
		randomize_wander()
		
