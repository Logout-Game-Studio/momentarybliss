extends Node2D

@export var shotting_delay:float = 1
var shotting:bool = true
var rain_drop = preload("res://nodes/obstacle/raindrop.tscn")

func _ready() -> void:
	_shoot_loop(rain_drop)
	
func _shoot_loop(bullet_ref:PackedScene) -> void:
	while shotting:
		await get_tree().create_timer(shotting_delay).timeout
		var bullet_instance = rain_drop.instantiate()
		get_tree().root.add_child.call_deferred(bullet_instance)
		bullet_instance.position = global_position
		
