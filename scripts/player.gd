extends CharacterBody2D

const SPEED = 110.0
const JUMP_VELOCITY = -280.0

@onready var playerSprite = $AnimatedSprite2D
@onready var gameManager = %GameManager
@onready var timer = $Timer
@onready var hitTimer = $HitTimer
@onready var hitSound = $HitSound

var hp = 5
var immortal = false
var gotPunched = false

func playIfNotPlaying(player :AnimatedSprite2D, animation :String):
	"""Plays character animation if it's not playing yet"""
	if (player.animation != animation):
		player.play(animation)

func _on_timer_timeout() -> void:
	print("Timer running")
	get_tree().reload_current_scene()
	self.queue_free()
	Engine.time_scale = 1


func _on_hit_timer_timeout() -> void:
	print("U'r mortal again")
	playerSprite.self_modulate.a = 1
	immortal = false


# po tom co nás hitne tak jsme nesmrtelní po dobu
# HitTimeru
func takeDamage(dmg :int):
	if immortal: return
	immortal = true
	hp -= dmg
	hitSound.play()
	playerSprite.self_modulate.a = 0.5
	gameManager.updateHp(hp)
	gotPunched = true
	if (hp <= 0):
		print("You're dead")
		Engine.time_scale = 0.5
		timer.start()
	else:
		hitTimer.start()


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

	if gotPunched:
		velocity.y = JUMP_VELOCITY *0.75
		velocity.x = JUMP_VELOCITY
		gotPunched = false
	move_and_slide()

