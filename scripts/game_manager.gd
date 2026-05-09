extends Node

@onready var cashLabel = $"Canvas/CashLabel"

var score = 0

func addPoint():
	score +=1
	cashLabel.text = "Nasbíráno kováků: %s" % score
	print(score)
