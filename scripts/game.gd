extends Node2D


@onready var truth_wheel = $WheelContainer/TruthWheel
@onready var dare_wheel = $WheelContainer/DareWheel
@onready var turn_label = $TurnLabel

func _ready():
	var player = GameState.current_player
	var choice = GameState.current_choice


	turn_label.text = "%s chose %s! Spin the wheel." % [player, choice]
	update_player_label()

	if choice == "Truth":
		truth_wheel.visible = true
		dare_wheel.visible = false
	else:
		truth_wheel.visible = false
		dare_wheel.visible = true

func spin_wheel(wheel: Node):
	var total_rotations = randf_range(3.0, 6.0)
	var degrees = total_rotations * 360.0 + randi_range(0, 359)
	var duration = 4.0

	var tween = get_tree().create_tween()
	tween.tween_property(
		wheel, "rotation_degrees", degrees, duration
	).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)

	tween.connect("finished", on_spin_finished)

func on_spin_finished():
	print("Wheel stopped!")

func _on_spin_button_pressed() -> void:
	if GameState.current_choice == "Truth":
		spin_wheel(truth_wheel)
	else:
		spin_wheel(dare_wheel)


func update_player_label():
	var label = get_node_or_null("PlayerLabel")
	if label:
		label.text = "Current Player: " + GameState.player_names[GameState.current_player_index]
	
	
func _on_next_player_pressed() -> void:
	GameState.current_player_index += 1

	if GameState.current_player_index >= GameState.player_names.size():
		GameState.current_player_index = 0  # or handle game end here if you want

	GameState.current_player = GameState.player_names[GameState.current_player_index]

	get_tree().change_scene_to_file("res://scenes/players_choice.tscn")
