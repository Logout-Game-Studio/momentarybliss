extends Node

var main_game_scene = preload("res://scenes/GameWorld.tscn")
var main_menu_scene = preload("res://scenes/MainMenu.tscn")
var game_over_scene = preload("res://scenes/GameOverWorld.tscn")
var current_scene:Node = null
var game_over_delay: float = 2

var player_score: int = 0
var score_count_delay:float = 0.5
var score_count_running: bool = false

func start_score_count_loop():
	score_count_running = true
	while score_count_running:
		await get_tree().create_timer(score_count_delay).timeout
		player_score += 1

func stop_score_count_loop():
	score_count_running = false

func get_score():
	return player_score

func game_over():
	await get_tree().create_timer(game_over_delay).timeout
	_load_scene(game_over_scene)

func load_main_game_scene():
	player_score = 0
	_load_scene(main_game_scene)

func load_main_menu_scene():
	_load_scene(main_menu_scene)

func _load_scene(packed:PackedScene):
	get_tree().change_scene_to_packed(packed)
