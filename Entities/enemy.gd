extends Area2D
class_name Enemy

@export var speed := 30.0

func _physics_process(delta: float) -> void:
	if get_parent().visible:
		global_position = Vector2(move_toward(global_position.x, get_parent().get_parent().get_parent().global_position.x, delta * speed), move_toward(global_position.y, get_parent().get_parent().get_parent().global_position.y, delta * speed))
		speed += randf_range(5.0, 10.0) * delta

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_tree().reload_current_scene()

func _on_area_entered(area: Area2D) -> void:
	if area is Enemy:
		global_position.x = move_toward(global_position.x, global_position.x + move_toward(global_position.x, $"../../".global_position.x, 25), 50)
		global_position.y = move_toward(global_position.y, global_position.y + move_toward(global_position.y, $"../../".global_position.y, 25), 50)
		get_parent().mitosis()

# Name name name... Secret Personality?
# Personality vendetta?
