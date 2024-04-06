extends Item

@onready var interaction_area = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "pickup")

func pickup():
	var player_character = get_tree().get_first_node_in_group("Player")
	player_character.increment_money()
	Events.money_collected.emit()
	Events.music_enable_chase.emit()
	queue_free()
