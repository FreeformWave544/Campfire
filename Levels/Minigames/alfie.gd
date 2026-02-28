extends Panel

signal done
@onready var enemy = $Enemy

func _on_visibility_changed() -> void:
	if visible:
		for i in range(7):
			var enemyInst = enemy.duplicate()
			enemyInst.global_position += Vector2(randf_range(100.0, 500.0), randf_range(10.0, 100.0))
			add_child(enemyInst)
			await get_tree().create_timer(5.0).timeout
		done.emit()
	else:
		for kid in get_children():
			kid.queue_free()

var cooldown := false
@export var cooldownTime := 0.1
func mitosis() -> void:
	print(cooldown)
	if !cooldown: return
	print("Split")
	var enemyInst = enemy.duplicate()
	enemyInst.global_position += Vector2(randf_range(100.0, 500.0), randf_range(10.0, 100.0))
	add_child(enemyInst)
	cooldown = true
	await get_tree().create_timer(cooldownTime).timeout
	cooldown = false
