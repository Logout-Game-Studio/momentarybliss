extends Sprite2D

@export var fill_sprite:Sprite2D
@export var initial_position:Vector2
@export var end_position:Vector2
@export var health_component: HealthComponent

func _ready() -> void:
	_update_sprite_fill()

func _on_health_component_damaged(value: int) -> void:
	_update_sprite_fill()

func _update_sprite_fill():
	var factor = 1 - (float(health_component.current_health) / float(health_component.max_health))
	fill_sprite.position.y = lerpf(initial_position.y,end_position.y,factor)
