extends Item

@onready var interaction_area = $InteractionArea

var keycard_string: String

func _ready():
	interaction_area.interact = Callable(self, "pickup")

func pickup():
	var player_character = get_tree().get_first_node_in_group("Player")
	player_character.inventory_append(self)
	Events.keycard_collected.emit()
	Events.music_enable_imminent.emit()
	queue_free()

func get_keycard_string() -> String:
	return keycard_string

func set_keycard_string(name: String):
	keycard_string = name
