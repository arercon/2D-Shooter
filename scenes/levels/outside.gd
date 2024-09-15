extends LevelParent

var inside_scene: PackedScene = preload("res://scenes/levels/inside.tscn")

func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.7)
	#get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/inside.tscn")
	get_tree().call_deferred("change_scene_to_packed", inside_scene)
