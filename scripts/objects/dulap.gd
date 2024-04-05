extends StaticBody2D

@onready var interaction_area = $InteractionArea

	
func _ready():
	interaction_area.interact = Callable(self, "_toggle_dulap")
	
func _toggle_dulap():
	queue_free()
