extends Panel

signal done
@onready var enemy = $Enemy

func _on_visibility_changed() -> void:
	if visible:
		for i in range(5):
			var enemyInst = enemy.duplicate()
			enemyInst.global_position += Vector2(randf_range(10.0, 100.0), randf_range(10.0, 100.0))
			add_child(enemyInst)
			print(enemyInst.global_position, Player.global_position)
			await get_tree().create_timer(5.0).timeout
		done.emit()
