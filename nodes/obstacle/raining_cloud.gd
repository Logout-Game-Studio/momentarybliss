extends Node2D

var direction = 1
@export var move_speed = 100

func _physics_process(delta: float) -> void:
    position.x += direction * move_speed


func _on_corner_detection_area_body_entered(body: Node2D) -> void:
    direction *= -1