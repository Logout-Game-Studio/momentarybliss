class_name HealthComponent extends Node

@export var max_health = 10
var current_health = 10

signal damaged(value:int)
signal healed(value:int)
signal died()

func damage(value: int):
	current_health -= value
	print("damage taken:" + str(value))
	print("current health:" + str(current_health))
	damaged.emit(value)
	if current_health <= 0:
		died.emit()

func heal(value:int):
	current_health += value
	print("heal taken:" + str(value))
	print("current health:" + str(current_health))
	if current_health >= max_health:
		current_health = max_health
	healed.emit(value)
