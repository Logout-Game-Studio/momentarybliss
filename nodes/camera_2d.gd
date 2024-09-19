class_name ScreenShakeEffect extends Node

@export var camera_2d:Camera2D

@export var trauma_reduction_rate:float = 1.0
@export var noise:FastNoiseLite

@export var max_y:float = 10
@export var max_x:float = 10

var trauma:float = 0.0
var time:float  = 0.0

@onready var initial_position:Vector2 = camera_2d.position

func _ready() -> void:
	add_trauma(2)

func _process(delta: float) -> void:
	time += delta
	trauma = max(trauma-delta*trauma_reduction_rate,0)
	camera_2d.position.x = initial_position.x + max_x *get_shake_intensity()*get_noise_from_seed(0)
	camera_2d.position.y = initial_position.y + max_y *get_shake_intensity()*get_noise_from_seed(1)


func add_trauma(trauma_amount:float):
	trauma = clamp(trauma + trauma_amount,0,1)

func get_shake_intensity() -> float:
	return trauma * trauma

func get_noise_from_seed(seed:int) -> float:
	noise.seed =  seed
	return noise.get_noise_1d(time)
