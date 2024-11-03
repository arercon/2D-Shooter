extends CharacterBody2D

var player_nearby:bool = false
var can_laser: bool = true
var can_damage: bool = true
var right_gun_use: bool = true

var health: int = 30

signal laser(pos, direction)

func hit():
	if can_damage:
		health -= 10
		can_damage = false
		$Timers/DamageTimer.start()
		if health <= 0:
			queue_free()
 
func _process(_delta: float) -> void:
	look_at(Globals.player_pos)
	if can_laser:
		var marker_node = $LaserSpawnPositions.get_child(right_gun_use)
		right_gun_use = not right_gun_use
		var pos: Vector2 = marker_node.global_position
		var direction: Vector2 = (Globals.player_pos - position).normalized()
		laser.emit(pos, direction)
		can_laser = false
		$Timers/LaserTimer.start()
			

func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_damage_timer_timeout() -> void:
	can_damage = true
