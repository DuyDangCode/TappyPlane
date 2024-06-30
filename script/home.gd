extends Control

@onready var highScore: Label = $MC/HighScore

func _ready():
	highScore.text = str(GameManager.getHighScore())
