extends Control

@onready var truth_list = $TruthList
@onready var dare_list = $DareList

var selected_truths = []
var selected_dares = []

func _ready() -> void:
	for truth in GameState.truths:
		add_prompt_to_list(truth_list, truth, selected_truths)
	for dare in GameState.dares:
		add_prompt_to_list(dare_list, dare, selected_dares)
		
func add_prompt_to_list(container, text, selected_array):
	var check = CheckBox.new()
	check.text = text
	check.connect("toggled", func(on):
		if on and not selected_array.has(text):
			selected_array.append(text)
		elif not on and selected_array.has(text):
			selected_array.erase(text)
	)
	container.add_child(check)


		


func _on_add_truth_pressed() -> void:
	show_add_prompt_popup("truth")
	
func _on_add_dare_pressed() -> void:
	show_add_prompt_popup("dare")
	
func show_add_prompt_popup(type):
	var text = await get_user_input("Enter Your " + type + ":")
	if text == "":
		return
	if type == "truth":
		GameState.truths.append(text)
		add_prompt_to_list(truth_list, text, selected_truths)
	else:
		GameState.dares.append(text)
		add_prompt_to_list(dare_list, text, selected_dares)
		
func get_user_input(prompt_text: String) -> String:
	return "Temporary example text"

func _on_go_to_players_page_pressed() -> void:
	GameState.selected_truths = selected_truths
	GameState.selected_dares = selected_dares
	get_tree().change_scene_to_file("res://scenes/player_setup.tscn")
