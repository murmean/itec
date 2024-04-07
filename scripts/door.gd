extends CharacterBody2D
@export var openable :bool
@export var siri: bool
@onready var upWall = $Door/upWall
@onready var downWall = $Door/downWall
@onready var hitbox = $Hitbox
@onready var hitbox_2 = $Hitbox2
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.voice_noise.connect(open_door)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_door_body_entered(body):
	if openable && !siri:	
		audio_stream_player_2d.play()
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
		
func open_door():
	if siri && !openable:
		audio_stream_player_2d.play()
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(upWall,"position",Vector2(upWall.position.x,-100),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(hitbox,"position",Vector2(hitbox.position.x,-15),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(downWall,"position",Vector2(downWall.position.x,100),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(hitbox_2,"position",Vector2(hitbox_2.position.x, 15),4).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
