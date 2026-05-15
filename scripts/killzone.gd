extends Area2D


@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	body.get_node("CollisionShape2D").queue_free()
	print("Youre dead")
	print(body.name)
	Engine.time_scale = 0.5
	timer.start()



func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
