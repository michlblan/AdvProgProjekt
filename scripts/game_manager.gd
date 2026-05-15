extends Node

@onready var cashLabel = $"Canvas/CashLabel"
var srdce: Array[Node];


var score = 0
var lives = 5

func addPoint():
	score +=1
	cashLabel.text = "Nasbíráno kováků: %s" % score
	print(score)

func enemyHit() -> bool:
	lives -= 1;
	updateLives(lives)
	return lives > 0

func updateLives(newLives :int) -> void:
	for i in range(len(srdce)):
		srdce[i].visible = newLives <= i


func _on_ready() -> void:
	srdce = $Canvas.find_children("Srdce*", "Sprite2D")
	print("Found children: ")
	print(srdce)
