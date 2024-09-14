extends Node2D

var direction: int = 1
@export var max_bounces: int = 2
var current_bounces: int = 0
@export var move_speed: float = 10

func _ready() -> void:
    var possible_directions = [1, -1]
    var rnd_direction = possible_directions[randi_range(0, possible_directions.size() - 1)]
    direction = rnd_direction

func _physics_process(delta: float) -> void:
    position.x += direction * move_speed


func _on_corner_detection_area_body_entered(body: Node2D) -> void:
    current_bounces += 1
    direction *= -1
    if current_bounces >= max_bounces:
        queue_free()
