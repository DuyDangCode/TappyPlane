extends Node2D

const SPEED_PIPES = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not GameManager.isGameOver:
		position.x -= SPEED_PIPES * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_lazer_body_entered(body: Node2D):
	if body.is_in_group(GameManager.GROUP_PLANE):
		GameManager.score += 1
		print(GameManager.score)

func _on_body_entered(body: Node2D):
	if body.is_in_group(GameManager.GROUP_PLANE):
		GameManager.isGameOver = true
