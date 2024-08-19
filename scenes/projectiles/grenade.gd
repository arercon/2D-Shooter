extends RigidBody2D

@export var grenade_speed = 1000
var directions = Vector2.UP

func _process(delta):
	position += directions * grenade_speed * delta
