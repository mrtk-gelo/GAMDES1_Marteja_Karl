extends CharacterBody2D

const GRAVITY = 900.0
const FLAP_FORCE = -300.0


func _ready():
	$AnimatedSprite2D.play("default") # NEW: starts the animation


func _physics_process(delta):
	velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("flap"):
		velocity.y = FLAP_FORCE

	move_and_slide()
