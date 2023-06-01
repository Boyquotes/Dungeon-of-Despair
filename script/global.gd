extends Node

var visited_level = []
var current_level = 0
var player_global_position : Vector2
var player_vec_position : Vector2
var current_detected_entities

func _process(_delta: float) -> void:
	if player_global_position:
		print(player_global_position)
		print(player_vec_position)
	if current_level != 0:
		print(current_level)
		
	if current_detected_entities:
		print(current_detected_entities)
