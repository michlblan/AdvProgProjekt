extends Node2D

@onready var player = $player
var enemies :Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemies = $Enemies.find_children("Slime*", "Area2D")

	for e in enemies:
		e.playerHit.connect(player.takeDamage)
	print("Connected %s enemies!" % len(enemies))
