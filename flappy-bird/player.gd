extends CharacterBody2D

const GRAVITY = 900.0
const FLAP_FORCE = -300.0


func _physics_process(delta):
	velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("flap"):
		velocity.y = FLAP_FORCE

	move_and_slide()
