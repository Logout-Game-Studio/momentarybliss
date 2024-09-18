class_name PlayerController extends CharacterBody2D

@export var animation_player:AnimationPlayer
@export var move_speed = 10


func _ready() -> void:
	GameManager.start_score_count_loop()
	
func _process(delta: float) -> void:
	if velocity.x != 0:
		animation_player.play("walk")
	else:
		animation_player.play("idle")

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


func die():
	GameManager.stop_score_count_loop()
	GameManager.game_over()
	queue_free()

func _on_health_component_died() -> void:
	die() # Replace with function body.
