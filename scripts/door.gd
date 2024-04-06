extends CharacterBody2D
@export var openable :bool
@onready var upWall = $Door/upWall
@onready var downWall = $Door/downWall
@onready var hitbox = $Hitbox
@onready var hitbox_2 = $Hitbox2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_door_body_entered(body):
	if openable:	
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(upWall,"position",Vector2(upWall.position.x,-100),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(hitbox,"position",Vector2(hitbox.position.x,-15),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(downWall,"position",Vector2(downWall.position.x,100),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(hitbox_2,"position",Vector2(hitbox_2.position.x, 15),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		
			
		


func _on_door_body_exited(body):
	if openable:
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(upWall,"position",Vector2(upWall.position.x,-30),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(hitbox,"position",Vector2(hitbox.position.x,-5),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(downWall,"position",Vector2(downWall.position.x,30),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(hitbox_2,"position",Vector2(hitbox_2.position.x,5),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		
