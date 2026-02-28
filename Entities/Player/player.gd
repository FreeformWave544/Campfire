extends CharacterBody2D
class_name Player

@export var speed = 300.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction.x:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if direction.y:
		velocity.y = direction.y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	$Limbs.look_at(get_global_mouse_position())
	$Limbs.rotate(89.6)
	move_and_slide()

func _input(_event: InputEvent) -> void:
	for body in $Limbs.get_overlapping_bodies():
		if Input.is_action_just_pressed("interact") and body.is_in_group("NPC"):
			$Dialogue.show()
			$Dialogue/Name.text = body.displayName
			for i in range(len(body.dialogue)): 
				$Dialogue/Text.text = body.dialogue[i]
				await get_tree().create_timer((0.06 * len(body.dialogue[i])) + 1.0).timeout
			$Dialogue.hide()
			if body.triggerEvent:
				match body.triggerEvent:
					"Firewall":
						$Minigames/Firewall.show()
						await $Minigames/Firewall.done
						body.queue_free()
					"Alfie":
						$Minigames/Alfie.show()
						await $Minigames/Alfie.done
						$Minigames/Alfie.hide()
						body.queue_free()
