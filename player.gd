extends CharacterBody2D

signal morreu

var estaPulando = false

@onready var animation := $AnimatedSprite2D as AnimatedSprite2D

const SPEED = 250
const JUMP_FORCE = -340.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
		estaPulando = true
	elif is_on_floor():
		estaPulando = false
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if !estaPulando:
			animation.play("Run")
	elif estaPulando:
		animation.play("Jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("Idle")
	move_and_slide()
	
func _levouDano():
	animation.play("Hit")
	emit_signal("morreu")

