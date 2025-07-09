extends Control


var player_names = []


func _ready():
	$StartGameButton.disabled = true

func _on_add_player_button_pressed() -> void:
	var player_name = $PlayerNameInput.text.strip_edges()
	if player_name != "":
		player_names.append(player_name)
	var label = Label.new()
	label.text = player_name
	label.add_theme_font_size_override("font_size", 24)
	label.add_theme_color_override("font_color", Color.DEEP_SKY_BLUE)
	var pixel_font := preload("res://assets/PixelOperator8.ttf")
	label.add_theme_font_override("font", pixel_font)
	
	$ScrollContainer/PlayerList.add_child(label)
	$PlayerNameInput.clear()
	$StartGameButton.disabled = false


func _on_start_game_button_pressed() -> void:
	GameState.player_names = player_names
	GameState.current_player = player_names[0]  # set first player

	get_tree().change_scene_to_file("res://scenes/players_choice.tscn")
