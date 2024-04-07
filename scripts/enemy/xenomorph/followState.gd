extends State
class_name  EnemyFollow

@export var enemy: CharacterBody2D
@export var animPlay: AnimatedSprite2D
var player : CharacterBody2D
@onready var alert = %Alert


func enter():
	player = get_tree().get_first_node_in_group("Player")
	animPlay.play("run")
	alert.play()
	Events.music_enable_chase.emit()
	Signals.found_player.emit()
	#animPlay.rotation_degrees += 260
	


func physics_update(delta):
	
	#enemy.rotation_degrees = enemy.global_position.angle_to_point(target.global_position) 
	
	var direction = player.global_position - enemy.global_position
	if direction.length() > 25:
		enemy.velocity = enemy.path.direction * 280
	else:
		enemy.velocity = Vector2()
		
func exit():
	Events.music_disable_chase.emit()

		



func _on_detection_area_body_exited(body):
	player = null
	Signals.lost_player.emit()
	Transitioned.emit(self,"Wander")
