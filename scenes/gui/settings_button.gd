extends TextureButton
@export var Settings: PackedScene
func _on_pressed():
	print("settings")
	get_tree().change_scene_to_packed(Settings)
