extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -280.0
@onready var playerSprite = $AnimatedSprite2D

func playIfNotPlaying(player :AnimatedSprite2D, animation :String):
	"""Plays character animation if it's not playing yet"""
	if (player.animation != animation):
		player.play(animation)

func _physics_process(delta: float) -> void:
	var isOnFloor = is_on_floor()
	# Add the gravity.

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		playerSprite.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if isOnFloor:
			playerSprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if isOnFloor:
			playerSprite.play("idle")

	if (direction == -1):
		playerSprite.flip_h = false

	if (direction == 1):
		playerSprite.flip_h = true

	if not isOnFloor:
		# Tento řádek nás posunuje k zemi
		velocity += (get_gravity()*0.8) * delta
		playIfNotPlaying(playerSprite, "jump" if (velocity.y < 0) else "fall")

	# print("Leaving fun with: " + playerSprite.animation)
	move_and_slide()
