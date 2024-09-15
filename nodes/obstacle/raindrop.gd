extends RigidBody2D

var damage = 1

func _on_body_entered(body: Node2D) -> void:
    if body.has_method("take_damage"):
        body.take_damage(damage)
