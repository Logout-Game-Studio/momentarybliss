class_name RainDrop extends RigidBody2D

@export var damage = 1

signal attacked

func _on_attack_area_area_entered(area: Area2D) -> void:
	if area is HitBoxArea:
		area.damage(damage)
	queue_free()
