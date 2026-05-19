extends Node

@onready var cashLabel = $"Canvas/CashLabel"
@onready var scoreLabel = $ScoreLabel
var hearts: Array

var score = 0

func _ready():
	hearts = $Canvas.find_children("Srdce*", "Sprite2D")

func addPoint():
	score +=1
	cashLabel.text = "Nasbíráno kováků: %s" % score
	scoreLabel.text = "You collected " + str(score) + " out of 15 coins."
	print(score)

func updateHp(newLives :int):
	for i in range(len(hearts)):
		hearts[i].visible = !(newLives <= i)
