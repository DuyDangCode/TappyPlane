extends Node2D

@export var pipePackage: PackedScene
@onready var pipeHolder = $PipesHolder
@onready var hMarker = $HMarker
@onready var lMarker = $LMarker

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPipes()

# Called every frame. 'delta' is the elapsed time since the previous frame.

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