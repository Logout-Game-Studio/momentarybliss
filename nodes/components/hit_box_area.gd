class_name HitBoxArea extends Area2D

@export var health_component:HealthComponent

func damage(value:int) -> void:
	health_component.damage(value)

func heal(value:int) -> void:
	health_component.heal(value)
