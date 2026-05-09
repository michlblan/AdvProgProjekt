extends Area2D

@onready var gameManager = %GameManager

func _on_body_entered(_body: Node2D) -> void:
	gameManager.addPoint()
	queue_free()
