extends State
class_name  EnemyFollow

@export var enemy: CharacterBody2D

var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func enter():
	player = get_tree().get_first_node_in_group("Player")
	%AnimatedSprite2D.play("run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(delta):
	var direction = player.global_position - enemy.global_position
	if direction.x < 0 : 
		%AnimatedSprite2D.flip_h = true
	elif direction.x > 0 :
		%AnimatedSprite2D.flip_h = false
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * enemy.SPEED
	else:
		enemy.velocity = Vector2()
		
	if direction.length() > 300:
		Transitioned.emit(self,"Wander")
