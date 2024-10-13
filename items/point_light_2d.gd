extends PointLight2D

var rotation_speed: int = 5
var available_options = ['laser', 'grenade', 'health']
var type = available_options[randi()%len(available_options)]

func _process(delta):
	rotation += rotation_speed * delta
