extends PathFollow2D

var player_near: bool = false

@onready var line1: Line2D = $Turret/RayCast2D/Line2D
@onready var line2: Line2D = $Turret/RayCast2D2/Line2D

@onready var flash1:Sprite2D = $Turret/Flash
@onready var flash2:Sprite2D = $Turret/Flash2

func fire():
	Globals.health -= 20
	flash1.modulate.a = 1
	flash2.modulate.a = 1
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(flash1, "modulate:a",0, randf_range(0.1,0.5))
	tween.tween_property(flash2, "modulate:a",0, randf_range(0.1,0.5))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line1.add_point($Turret/RayCast2D2.target_position)
	line2.add_point($Turret/RayCast2D2.target_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += 0.01 * delta
	if player_near:
		$Turret.look_at(Globals.player_pos)
		

func _on_notice_area_body_entered(_body: Node2D) -> void:
	player_near = true
	$AnimationPlayer.play("laser_load")


func _on_notice_area_body_exited(_body: Node2D) -> void:
	player_near = false
	$AnimationPlayer.stop()
