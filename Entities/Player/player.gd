extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction.y:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	$Limbs.look_at(get_global_mouse_position())
	$Limbs.rotate(89.6)
	move_and_slide()

func _input(_event: InputEvent) -> void:
	for body in $Limbs.get_overlapping_bodies():
		if Input.is_action_just_pressed("interact") and body.is_in_group("Interactable"):
			pass
