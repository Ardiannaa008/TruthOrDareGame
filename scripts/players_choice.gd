extends Node

@onready var turn_label = $TurnLabel

func _ready():
	print("Player choice scene loaded for player:", GameState.current_player)
	turn_label.text = "%s, choose Truth or Dare!" % GameState.current_player
	
func _on_truth_button_pressed() -> void:
	print("Truth chosen by", GameState.current_player)
	GameState.current_choice = "Truth"
	print("✅ Going to game.tscn with:", GameState.current_player, GameState.current_choice)

	get_tree().change_scene_to_file("res://scenes/game.tscn")
	

func _on_dare_button_pressed() -> void:
	print("Dare chosen by", GameState.current_player)

	GameState.current_choice = "Dare"
	print("✅ Going to game.tscn with:", GameState.current_player, GameState.current_choice)


	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
