extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var playerSprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var isOnFloor = is_on_floor()
	# Add the gravity.

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	# Chtělo by to předělat to přehrávání animací
	# Za chvíly to bude hrozný clusterfuck if a if not
	if direction:
		velocity.x = direction * SPEED
		if isOnFloor:
			playerSprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if isOnFloor:
			playerSprite.play("idle")

	if (direction == -1):
		playerSprite.flip_h = true

	if (direction == 1):
		playerSprite.flip_h = false

	if not isOnFloor:
		velocity += get_gravity() * delta
		print(playerSprite.animation)
		if (playerSprite.animation != "jump"):
			print("not jumping jet")
			playerSprite.play("jump")

	move_and_slide()
