extends Node2D

class_name Slime

const SPEED = 60
var direction = 1

signal hit(amount :int)

@onready var rayCastRight = $rayCastRight
@onready var rayCastLeft = $rayCastLeft
@onready var animatedSprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (rayCastRight.is_colliding()):
		direction = -1
		animatedSprite.flip_h = true
	if (rayCastLeft.is_colliding()):
		direction = 1
		animatedSprite.flip_h = false
	position.x += direction * SPEED * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		print("Whoa")
		hit.emit(1)


func _on_body_entered(_body: Node2D) -> void:
	hit.emit(1)


