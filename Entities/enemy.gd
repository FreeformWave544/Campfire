extends Area2D

func _physics_process(delta: float) -> void:
	global_position = Vector2(move_toward(global_position.x, get_parent().get_parent().get_parent().global_position.x, delta * 15), move_toward(global_position.y, get_parent().get_parent().get_parent().global_position.y, delta * 15))

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene()
