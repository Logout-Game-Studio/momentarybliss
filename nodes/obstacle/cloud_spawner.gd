extends Node2D

var raining_cloud = preload("res://nodes/obstacle/raining_cloud.tscn")
@export var spawn_delay = 2

func _ready() -> void:
	while (true):
		await get_tree().create_timer(spawn_delay).timeout
		var cloud_instance = raining_cloud.instantiate()
		owner.add_child(cloud_instance)
		cloud_instance.position = global_position
