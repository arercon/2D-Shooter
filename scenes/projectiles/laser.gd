extends Area2D

@export var laser_speed: int = 1000
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * laser_speed * delta
