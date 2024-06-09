extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animationPlane = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("fly"):
		velocity.y = JUMP_VELOCITY

	if is_on_floor():
		animationPlane.stop()
		set_physics_process(false)
	move_and_slide()
