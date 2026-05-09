extends Area2D

@onready var gameManager = %GameManager
@onready var animationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	gameManager.addPoint()
	animationPlayer.play("PickupAnimation")
