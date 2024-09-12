class_name DamageArea extends Area2D

@export var damage: int = 10
var damage_delay: float = 0.5
var bodies_in_range: Array[Node2D] = []

func _on_body_entered(body: Node2D) -> void:
    if body.has_method("take_damage"):
        bodies_in_range.append(body)
        _loop_damage()


func _on_body_exited(body: Node2D) -> void:
    if bodies_in_range.has(body):
        bodies_in_range.erase(body)

func _loop_damage():
    while (!bodies_in_range.is_empty()):
        await get_tree().create_timer(damage_delay).timeout
        for body in bodies_in_range:
            body.take_damage(damage)