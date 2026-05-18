extends Node2D

const SPEED = 60
var direction = 1

@onready var rayCastRight = $rayCastRight
@onready var rayCastLeft = $rayCastLeft
@onready var animatedSprite = $AnimatedSprite2D

signal playerHit(dmg :int)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (rayCastRight.is_colliding()):
		direction = -1
		animatedSprite.flip_h = true
	if (rayCastLeft.is_colliding()):
		direction = 1
		animatedSprite.flip_h = false
	position.x += direction * SPEED * delta



func _on_body_entered(body: Node2D) -> void:
	print("Body of slime entered")
	playerHit.emit(1)
	pass # Replace with function body.
