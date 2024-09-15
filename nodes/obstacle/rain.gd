extends Node2D
var rain_drop: RainDrop = preload("res://nodes/obstacle/raindrop.tscn").instantiate()

func _ready() -> void:
	get_tree().root.add_child.call_deferred(rain_drop)
	rain_drop.attacked.connect(_reset_rain_drop)
	
func _reset_rain_drop():
	if rain_drop:
		rain_drop.global_position = global_position
