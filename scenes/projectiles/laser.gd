extends Area2D

@export var laser_speed: int = 1000
var direction: Vector2 = Vector2.UP

func _ready() -> void:
	$SelfdestructTimer.start()

func _process(delta):
	position += direction * laser_speed * delta


func _on_body_entered(body: Node2D):
	#if body.has_method("hit"):
	if "hit" in body:
		body.hit()
	queue_free()


func _on_selfdestruct_timer_timeout() -> void:
	queue_free()
