extends Panel

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		get_parent().get_parent().scale += Vector2(0, 0.7)
		get_parent().get_parent().get_parent().find_child("Spencer").queue_free()
		queue_free()
