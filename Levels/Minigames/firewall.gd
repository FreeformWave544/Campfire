extends Panel

@onready var block := $Block

func _physics_process(delta: float) -> void:
	if visible:
		$ProgressBar.value -= 5.0 * delta

func _on_visibility_changed() -> void:
	while visible:
		block.position = Vector2(randf_range(50, 450), randf_range(50, 450))
		await $Block.pressed
		$ProgressBar.value += randf_range(7.5, 10.0)
		if $ProgressBar.value == 100.0:
			break
	hide()
	get_parent().get_parent().find_child("Dialogue").show()
	get_parent().get_parent().find_child("Dialogue").find_child("Name").text = "??"
	get_parent().get_parent().find_child("Dialogue").find_child("Text").text = "Ah what a shame. Will's microphone blew up. What a tragic death..."
