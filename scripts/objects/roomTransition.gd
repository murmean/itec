extends StaticBody2D

@onready var interaction_area = $InteractionArea
@export var loc: Vector2
var player: Player
var inside : bool = false
func _ready():
	interaction_area.interact = Callable(self, "go_to_room")
	player =get_tree().get_first_node_in_group("Player")
func _process(delta):
	pass

func go_to_room():
	player.global_position = loc
	
	
