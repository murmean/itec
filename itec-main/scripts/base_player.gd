extends CharacterBody2D
class_name Player

const JUMP_VELOCITY = -400.0
const MOVE_SPEED = 400

var movement_speed = MOVE_SPEED
@onready var interaction_area: InteractionArea =  $InteractionArea

var money = 0
var inventory = []

var b_is_hidden: bool = false

func _physics_process(delta):
	var x_dir = Input.get_action_strength("right") -	Input.get_action_strength("left")
	var y_dir = Input.get_action_strength("down") -	Input.get_action_strength("up")
	var mov = Vector2(x_dir,y_dir)
	velocity = mov.normalized() * movement_speed
	move_and_slide()

func get_money() -> int:
	return money

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
