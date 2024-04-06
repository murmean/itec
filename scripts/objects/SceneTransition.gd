extends StaticBody2D

@onready var interaction_area = $InteractionArea
@export var next_scene: PackedScene

var inside : bool = false
func _ready():
	interaction_area.interact = Callable(self, "change_map")

func _process(delta):
	pass


func change_map():
	get_tree().change_scene_to_packed(next_scene)
	
	
