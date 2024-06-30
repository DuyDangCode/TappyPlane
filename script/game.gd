extends Node2D

@export var pipePackage: PackedScene
@onready var pipeHolder = $PipesHolder
@onready var hMarker = $HMarker
@onready var lMarker = $LMarker
@onready var timer: Timer = $Timer

const MIN_TIMER: float = 0.1
const AMOUNT_TIMER_EXTRA: float = 0.1

func _ready():
	spawnPipes()
	SignalManager.updateGameMode.connect(updateGameMode)

func updateGameMode():
	if timer.wait_time > MIN_TIMER:
		timer.wait_time -= AMOUNT_TIMER_EXTRA

func spawnPipes():
	var newPipes = pipePackage.instantiate()
	var randPosY = randf_range(hMarker.position.y, lMarker.position.y)
	newPipes.position = Vector2(hMarker.position.x, randPosY)
	pipeHolder.add_child(newPipes)

func _process(delta):
	pass

func _on_timer_timeout():
	if not GameManager.isGameOver:
		spawnPipes()

func _on_plane_custom_signal():
	print("plane is stop")
	pass # Replace with function body.
