extends StaticBody2D

@onready var interaction_area = $InteractionArea
@export var player: Player
var inside : bool = false
func _ready():
	interaction_area.interact = Callable(self, "_toggle_dulap")
func _toggle_dulap():
	player.visible = false
	inside = true
	player.global_position = global_position
