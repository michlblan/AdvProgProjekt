extends Node

@onready var scoreLabel = $Label

var score = 0

func addPoint():
	score +=1
	scoreLabel.text = "Hello, u collected %s coins" % score
	print(score)
