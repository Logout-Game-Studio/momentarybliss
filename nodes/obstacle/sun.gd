extends MovingObstacle

@export var heal_value: int = 1
var heal_delay: float = 0.5
var bodies_in_range: Array[HitBoxArea] = []


func _on_heal_area_area_entered(area: Area2D) -> void:
	if area is HitBoxArea:
		bodies_in_range.append(area)
		_loop_heal()
		print("body entered")


func _on_heal_area_area_exited(area: Area2D) -> void:
	if area is HitBoxArea && bodies_in_range.has(area):
		bodies_in_range.erase(area)

func _loop_heal():
	while (!bodies_in_range.is_empty()):
		await get_tree().create_timer(heal_delay).timeout
		for body in bodies_in_range:
			body.heal(heal_value)
