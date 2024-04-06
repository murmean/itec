extends TextureButton

var item_sold

func set_item_sold(item_sold: Item):
	self.item_sold = item_sold
	var item_sprite = get_children()[0]
	match typeof(item_sprite):
		Sprite2D:
			item_sprite.texture = item_sold.get_sprite()
