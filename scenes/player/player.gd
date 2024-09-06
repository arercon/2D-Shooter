extends CharacterBody2D

signal laser_has_been_shot(position, direction)
signal grande_has_been_thrown(position, direction)

var can_laser : bool = true
var can_grenade : bool = true

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	
	# laser input
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser:
		$GPUParticles2D.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$Lasertimer.start()
		laser_has_been_shot.emit(selected_laser.global_position, player_direction)
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$Grenadetimer.start()
		var pos = $LaserStartPositions/Marker2D2.global_position
		grande_has_been_thrown.emit(pos, player_direction)

func _on_lasertimer_timeout():
	can_laser = true

func _on_grenadetimer_timeout():
	can_grenade = true
