extends Control
	




func _on_start_button_pressed() -> void:
	print("Start button was pressed!")
	get_tree().change_scene_to_file("res://scenes/player_setup.tscn")
