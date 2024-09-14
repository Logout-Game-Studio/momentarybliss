extends Node2D

class CloudInfo:
	var resource:Resource
	var chance: float = 0.2
	func _init(resource: Resource, chance: float):
		self.resource = resource
		self.chance = chance

var clouds_array: Array[CloudInfo] = [
	CloudInfo.new(preload("res://nodes/obstacle/raining_cloud.tscn"), 0.5),
	CloudInfo.new(preload("res://nodes/obstacle/sun.tscn"), 0.2)
]
@export var spawn_delay = 2

func _ready() -> void:
	while (true):
		await get_tree().create_timer(spawn_delay).timeout
		var cloud = clouds_array[randi_range(0, clouds_array.size())]
		owner.add_child(cloud.resource.instantiate())
