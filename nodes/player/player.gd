class_name PlayerController extends CharacterBody2D


@export var screen_shake_effect:ScreenShakeEffect
@export var health_component:HealthComponent
@export var dust_particle:GPUParticles2D
@export var animation_player:AnimationPlayer
@export var audio_player_walking:AudioStreamPlayer2D
@export var audio_player_damage:AudioStreamPlayer2D
@export var move_speed = 10
@export var jump_force = 250

func _ready() -> void:
	GameManager.start_score_count_loop()

	
func _process(delta: float) -> void:
	if velocity.x != 0:
		dust_particle.emitting = true
		animation_player.play("walk")
		if !audio_player_walking.playing:
			audio_player_walking.playing = true
	else:
		dust_particle.emitting = false
		animation_player.play("idle")
	
	if Input.is_action_just_pressed("ui_down"):
		die()

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
	
func _on_health_component_died() -> void:
	die() # Replace with function body.

func _on_health_component_damaged(value: int) -> void:
	audio_player_damage.playing = true
	if screen_shake_effect:
		screen_shake_effect.add_trauma(1)
