extends Area2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 600.0

func _physics_process(delta):
	position += direction * speed * delta

# Cleanup if it flies off screen (optimization)
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
