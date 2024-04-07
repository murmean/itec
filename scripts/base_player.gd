extends CharacterBody2D
class_name Player

const JUMP_VELOCITY = -400.0
const MOVE_SPEED = 400
var movement_speed = MOVE_SPEED
@export var invisible: bool = false
@export var cards : int
@export var Spawn_point : Marker2D
@onready var interaction_area: InteractionArea =  $InteractionArea
@onready var flashlight =%flashlight
@onready var transition_player = $CanvasLayer/TransitionPlayer
@onready var color_rect = $CanvasLayer/ColorRect
@onready var label_2 = $CanvasLayer/Label2
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var loop_timer = $loopTimer
@onready var death_sfx = $deathSFX

#physics
var mov: Vector2

#cards

var current_cards = 0
var needed_cards


var b_is_hidden: bool = false
#money

var money = 0
var inventory = []
# Get the gravity from the project settings to be synced with RigidBody nodes.


func _ready():
	label_2.text = "Cards 0/" + str(sgTon.cards_needed)
	transition_player.play("de_fade")
	Signals.level_finished.connect(_change_scene)
	$AnimatedSprite2D.rotation_degrees += 260 	
	Signals.card_found.connect(collected_cards)
	loop_timer.start()


func _physics_process(delta):
	
	look_at(get_global_mouse_position())
	

	 	
	var x_dir = Input.get_action_strength("right") -	Input.get_action_strength("left")
	var y_dir = Input.get_action_strength("down") -	Input.get_action_strength("up")
	mov = Vector2(x_dir,y_dir)
	if mov:
		$AnimatedSprite2D.play("run")

	velocity = mov.normalized() * movement_speed

	move_and_slide()

func get_money() -> int:
	return money

func _input(event):
	if event.is_action_pressed("flashlight"):
		if flashlight.enabled ==true : flashlight.enabled =false 
		else: flashlight.enabled = true
func increment_money():
	money += 1

func remove_money(nr: int):
	money -= nr

func inventory_append(item: Item):
	inventory.append(item)

func get_is_hidden() -> bool:
	return b_is_hidden

func player_hide():
	b_is_hidden = true
	movement_speed = 0

func player_show():
	b_is_hidden = false
	movement_speed = MOVE_SPEED

func die():
	hide()
	Events.music_disable_chase.emit()
	death_sfx.play()
	set_physics_process(false)
	transition_player.play("fade")
	transition_player.queue("de_fade")
	await get_tree().create_timer(1).timeout
	show()
	set_physics_process(true)
	global_position = Spawn_point.global_position
	

	
func collected_cards():
	current_cards +=1
	if current_cards == sgTon.cards_needed:
		sgTon.b_has_cards = true
		Events.music_enable_imminent.emit()
	label_2.text = "Cards: " + str(current_cards) +" / "+ str(sgTon.cards_needed)

func _change_scene():
	color_rect.show()
	transition_player.play("fade")


func _on_loop_timer_timeout():
	if mov:
		audio_stream_player_2d.play()
