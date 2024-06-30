extends Node2D

const GROUP_PLANE: String = "plane"
var score: int = 0
var isGameOver = false
var highScore = 0
var speedPipesExtra: float = 0
const EXTRA_SPEED_AMOUNT: float = 0.01
const MAX_SPEED_EXTRA: float = 1.5
var gamePack: PackedScene = preload ("res://scenes/game.tscn")
var homePack: PackedScene = preload ("res://scenes/home.tscn")
var isPlaying: bool = false

func _ready():
  get_tree().change_scene_to_packed(homePack)
  SignalManager.gameOver.connect(loadHomeScreen)

func _process(delta):
  if Input.is_action_just_pressed("fly") and not isPlaying:
    get_tree().change_scene_to_packed(gamePack)
    isPlaying = true
    isGameOver = false

func loadHomeScreen():
  get_tree().change_scene_to_packed(homePack)
  if score > highScore:
    highScore = score
  score = 0
  isGameOver = true
  isPlaying = false

func getScore() -> int:
  return score

func setScore() -> void:
  score += 1
  if score > highScore and score < 1000:
    highScore = score
  SignalManager.updateScore.emit()
  if speedPipesExtra < MAX_SPEED_EXTRA:
    speedPipesExtra += EXTRA_SPEED_AMOUNT
    # SignalManager.updateGameMode.emit()

func getSpeedPipesExtra() -> int:
  return speedPipesExtra

func getHighScore() -> int:
  return highScore