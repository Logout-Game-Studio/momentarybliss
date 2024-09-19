class_name MovingObstacle extends CharacterBody2D

var direction: int = 1
@export var max_bounces: int = 2
var current_bounces: int = 0
var move_speed: float = 5
@export var max_move_speed: float = 6
@export var min_move_speed: float = 3
@export var particle_on_despawn:PackedScene

func _ready() -> void:
	move_speed = randf_range(min_move_speed,max_move_speed) #randomize speed
	velocity = Vector2(_get_random_direction(),0)
	move_and_slide()

func _get_random_direction() -> int:
	var possible_directions = [1, -1] #randomize direction
	var rnd_direction = possible_directions[randi_range(0, possible_directions.size() - 1)]
	return rnd_direction

func _physics_process(delta: float) -> void:
	position.x += direction * move_speed

func _on_corner_detection_area_body_entered(body: Node2D) -> void:
	current_bounces += 1
	direction *= -1
	if current_bounces >= max_bounces:
		if particle_on_despawn:
			_instantiate_particle()
		queue_free()

func _instantiate_particle():
	var particle_instance:GPUParticles2D = particle_on_despawn.instantiate()
	get_tree().current_scene.add_child(particle_instance)
	particle_instance.global_position = self.global_position
	particle_instance.emitting = true
	particle_instance.finished.connect(func(): particle_instance.queue_free())
