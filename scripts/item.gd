class_name Item
extends Node2D

var item_dir: String
var item_name: String
var item_sprite: Sprite2D

func Item(item_dir: String, item_name: String, item_sprite: Sprite2D):
	self.item_dir = item_dir
	self.item_name = item_name
	self.item_sprite = item_sprite

func get_item_dir() -> String:
	return item_dir

func get_item_name() -> String:
	return item_name

func get_item_sprite() -> Sprite2D:
	return item_sprite
