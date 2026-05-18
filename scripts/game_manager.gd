extends Node

@onready var cashLabel = $"Canvas/CashLabel"
var hearts: Array

var score = 0

func _ready():
	hearts = $Canvas.find_children("Srdce*", "Sprite2D")

func addPoint():
	score +=1
	cashLabel.text = "Nasbíráno kováků: %s" % score
	print(score)

func updateHp(newLives :int):
	print("Nově máme %s životů" % newLives)
	for i in range(len(hearts)):
		hearts[i].visible = !(newLives <= i)
