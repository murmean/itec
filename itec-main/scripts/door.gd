extends CharacterBody2D
@export var openable :bool
@onready var animPlay = %AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_body_entered(body):
	if openable:
		if body.is_in_group("Player"):
			animPlay.play("opened")
		
			
		


func _on_door_body_exited(body):
	if openable:
		animPlay.play("close")
