extends Node2D

@export var spots: Array[Node2D] = []
var rain_drop: Node2D = preload("res://nodes/obstacle/raindrop.tscn").instantiate()

func _ready() -> void:
	get_tree().root.add_child.call_deferred(rain_drop)
	_reset_rain_drop()
	rain_drop.body_entered.connect(_on_rain_drop_body_entered)

func _on_rain_drop_body_entered(body: Node2D):
	_reset_rain_drop()

func _reset_rain_drop():
	if rain_drop:
		rain_drop.global_position = spots[randi_range(0, spots.size() - 1)].global_position
