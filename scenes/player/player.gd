extends CharacterBody2D

signal laser_has_been_shot(position)
signal grande_has_been_thrown(position)

var can_laser : bool = true
var can_grenade : bool = true

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	# laser input
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$Lasertimer.start()
		laser_has_been_shot.emit(selected_laser.global_position)
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos = $LaserStartPositions/Marker2D2.global_position
		can_grenade = false
		$Grenadetimer.start()
		grande_has_been_thrown.emit(pos)

func _on_lasertimer_timeout():
	can_laser = true

func _on_grenadetimer_timeout():
	can_grenade = true
