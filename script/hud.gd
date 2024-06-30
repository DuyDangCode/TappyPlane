extends Control

@onready var scoreLabel: Label = $MarginContainer/scoreLabel

func _ready():
	scoreLabel.text = str(GameManager.getScore())
	SignalManager.updateScore.connect(updateScoreLabel)

func updateScoreLabel():
	scoreLabel.text = str(GameManager.getScore())
