extends CharacterBody2D
#

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var health = 100
var player_name = "Kuya Karl "
var enemy_name = "Cardo "
var gameover = "Game Over!"
var gamestart = "Game Start!"

func _ready():
	print(player_name, "has entered the scene with ", health, " HP.")
	print(gamestart)
	print("-------------------------------------------")
	enemy_attach(10)
	minion_attach(5)
	enemy_attach(10)
	enemy_attach(10)
	minion_attach(5)
	minion_attach(5)
	minion_attach(5)
	minion_attach(5)
	enemy_attach(10)
	enemy_attach(10)
	minion_attach(5)
	enemy_attach(10)
	minion_attach(5)
	minion_attach(5)
	print(gameover)
	
func take_damage(amount):
	health -= amount
	print("Health is now: ", health)
	
func enemy_attach(amount):
	print(enemy_name, "(enemy) attacked: ", amount, " HP")
	health -= amount
	print("Health is now: ", health)
	print("-------------------------------------------")
	
func minion_attach(amount):
	print("Minion Attack: ", amount, " HP")
	health -= amount
	print("Health is now: ", health)
	print("-------------------------------------------")
	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
