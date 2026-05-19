extends Node

@onready var cashLabel = $"Canvas/CashLabel"
@onready var scoreLabel = $ScoreLabel

var score = 0

func addPoint():
	score +=1
	cashLabel.text = "Nasbíráno kováků: %s" % score
	scoreLabel.text = "You collected " + str(score) + " out of 15 coins."
	print(score)
