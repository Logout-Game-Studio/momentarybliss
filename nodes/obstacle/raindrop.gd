class_name RainDrop extends RigidBody2D

@export var damage = 1
@export var particle:PackedScene

signal attacked

func _on_attack_area_area_entered(area: Area2D) -> void:
	if area is HitBoxArea:
		area.damage(damage)
		queue_free()


func _on_attack_area_body_entered(body: Node2D) -> void:
	if body != self and body is not RainDrop:
		_instantiate_particle()
		queue_free()

func _instantiate_particle():
	var particle_instance:GPUParticles2D = particle.instantiate()
	particle_instance.modulate = get_node("Sprite2D").modulate
	get_tree().current_scene.add_child(particle_instance)
	particle_instance.global_position = self.global_position
	particle_instance.emitting = true
	particle_instance.finished.connect(func(): particle_instance.queue_free())
