extends Node2D

@export var pipePackage: PackedScene
@onready var pipeHolder = $PipesHolder

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPipes()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func spawnPipes():
	var newPipes = pipePackage.instantiate()
	newPipes.position = Vector2(480, 480)
	pipeHolder.add_child(newPipes)

func _process(delta):
	pass

func _on_timer_timeout():
	spawnPipes()