extends PathFollow2D

var player_near: bool = false

@onready var line1: Line2D = $Turret/RayCast2D/Line2D
@onready var line2: Line2D = $Turret/RayCast2D2/Line2D

func fire():
	Globals.health -= 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line2.add_point($Turret/RayCast2D2.target_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += 0.01 * delta
	if player_near:
		$Turret.look_at(Globals.player_pos)
		

func _on_notice_area_body_entered(_body: Node2D) -> void:
	player_near = true
	print(_body)
	$AnimationPlayer.play("laser_load")


func _on_notice_area_body_exited(_body: Node2D) -> void:
	player_near = false
