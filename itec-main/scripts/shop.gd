extends Node

const KEYCARD = preload("res://scenes/items/keycard.tscn")

@onready var interaction_area = $InteractionArea

@export var item_price: int
@export var keycard_string: String

var b_open: bool = true
var item_sold

func _ready():
	interaction_area.interact = Callable(self, "_toggle_shop")
	item_sold = KEYCARD.instantiate()
	item_sold.set_keycard_string(keycard_string)
	
func _toggle_shop():
	var player_character = get_tree().get_first_node_in_group("Player")
	if(player_character.get_money() >= item_price && b_open):
		b_open = false
		player_character.remove_money(item_price)
		player_character.inventory_append(item_sold)
		Events.shop_purchase.emit()
		Events.music_disable_chase.emit()
