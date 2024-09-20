extends Control

func _on_retry_button_down() -> void:
	GameManager.load_main_game_scene()

func _on_rmm_pressed() -> void:
	GameManager.load_main_menu_scene()
