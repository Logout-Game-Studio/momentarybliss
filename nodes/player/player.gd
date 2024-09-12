class_name PlayerController extends CharacterBody2D

@export var move_speed = 10

func _physics_process(delta: float) -> void:
    var fall = velocity.y + (delta * ProjectSettings.get_setting("physics/2d/default_gravity")) if not is_on_floor() else 0
    velocity = Vector2(_get_movement(), fall)
    move_and_slide()

func _get_movement():
    var direction = 0
    if (Input.is_action_pressed("move_left")):
        direction = -1
    elif (Input.is_action_pressed("move_right")):
        direction = 1
    
    return direction * move_speed