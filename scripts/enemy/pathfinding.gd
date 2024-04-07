extends Node2D
class_name PathFinding

@onready var target: CharacterBody2D = owner.get_parent().find_child("basePlayer")
@onready var reaction_time = $ReactionTime
@onready var navigation_agent_2d = $NavigationAgent2D

var direction = Vector2.ZERO


func _ready():
	Signals.found_player.connect(start_timer)

func update_target():
	if target !=null:
		navigation_agent_2d.target_position = target.position
	
func _on_reaction_time_timeout():
	update_target()
	direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	
func start_timer():
	reaction_time.start()
