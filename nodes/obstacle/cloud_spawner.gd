extends Node2D

var raining_cloud = preload("res://nodes/obstacle/raining_cloud.tscn")
@export var spawn_delay = 2
@export var instantiated_clouds:Array[Node2D]

func _ready() -> void:
	while (true):
		await get_tree().create_timer(spawn_delay).timeout
		var cloud_instance = raining_cloud.instantiate()
		get_tree().current_scene.add_child(cloud_instance)
		instantiated_clouds.append(cloud_instance)
		cloud_instance.tree_exiting.connect(func(): if instantiated_clouds.has(cloud_instance): instantiated_clouds.erase(cloud_instance))
		cloud_instance.position = global_position

func _exit_tree() -> void:
	var clouds = instantiated_clouds.duplicate()
	instantiated_clouds.clear()
	for cloud in clouds:
		cloud.queue_free()
