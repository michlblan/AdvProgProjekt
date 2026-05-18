extends Node2D


@onready var player = $player
@onready var enemy = $Slime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy.playerHit.connect(player.takeDamage)
	print("Connected")


