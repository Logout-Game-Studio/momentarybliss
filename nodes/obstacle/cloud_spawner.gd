extends Node2D

var raining_cloud = preload("res://nodes/obstacle/raining_cloud.tscn")
@export var spawn_delay = 2

func _ready() -> void:
	while (true):
		await get_tree().create_timer(spawn_delay).timeout
		owner.add_child(raining_cloud.instantiate())
