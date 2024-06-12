extends Node2D

const SPEED_PIPES = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SPEED_PIPES * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("IM FREE")
	queue_free()
