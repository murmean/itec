extends StaticBody2D

@onready var interaction_area = $InteractionArea


func _ready():
	interaction_area.interact = Callable(self, "_toggle_dulap")
	
func _toggle_dulap():
	var player_character = get_tree().get_first_node_in_group("Player")
	match player_character.get_is_hidden():
		false:
			player_character.player_hide()
			Events.locker_enter.emit()
		true:
			player_character.player_show()
			Events.locker_exit.emit()
	
	Events.music_enable_ambient.emit()
