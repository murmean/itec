extends StaticBody2D

@onready var interaction_area = $InteractionArea
@export var next_scene: PackedScene
@export var cards_needed : int

@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var inside : bool = false
func _ready():
	interaction_area.interact = Callable(self, "change_map")
	Signals.card_found.connect(decrease_cards)
	Signals.cards_required.emit(cards_needed)
	sgTon.cards_needed = cards_needed
func _process(delta):
	pass




func decrease_cards():
	cards_needed -= 1
	
func change_map():
	if cards_needed == 0:
		audio_stream_player_2d.play()
		await audio_stream_player_2d.finished
		Signals.level_finished.emit()
		get_tree().change_scene_to_packed(next_scene)
		
		
