extends CharacterBody2D
class_name Player

const JUMP_VELOCITY = -400.0
const MOVE_SPEED = 400
var movement_speed = MOVE_SPEED
@export var invisible: bool = false
@export var cards : int

@onready var interaction_area: InteractionArea =  $InteractionArea
@onready var flashlight =%flashlight
@onready var transition_player = $CanvasLayer/TransitionPlayer
@onready var color_rect = $CanvasLayer/ColorRect
@onready var label_2 = $CanvasLayer/Label2


#cards

var current_cards = 0
var needed_cards


var b_is_hidden: bool = false
#money

var money = 0
var inventory = []
# Get the gravity from the project settings to be synced with RigidBody nodes.


func _ready():
	transition_player.play("de_fade")
	Signals.level_finished.connect(_change_scene)
	$AnimatedSprite2D.rotation_degrees += 260
	Signals.card_found.connect(collected_cards)
	Signals.cards_required.connect(_required_cards)


func _physics_process(delta):
	
	look_at(get_global_mouse_position())
	

	 	
	var x_dir = Input.get_action_strength("right") -	Input.get_action_strength("left")
	var y_dir = Input.get_action_strength("down") -	Input.get_action_strength("up")
	var mov = Vector2(x_dir,y_dir)
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
	queue_free()
	
func _required_cards(cards):
	needed_cards = cards
	
func collected_cards():
	current_cards +=1
	label_2.text = "Cards: " + str(current_cards) +" / "+ str(needed_cards)

func _change_scene():
	color_rect.show()
	transition_player.play("fade")
