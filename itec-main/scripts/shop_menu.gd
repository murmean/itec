extends Control

const SHOP_MENU_ITEM = preload("res://tscn/shop_menu_item.tscn")

@onready var v_box_container = $VBoxContainer

@export
var item_list = []

func _ready():
	for item in item_list:
		match typeof(item):
			Item:
				var new_menu_item = SHOP_MENU_ITEM.instantiate()
				new_menu_item.set_item_sold(item)
				v_box_container.add_child(new_menu_item)
