extends Node

var visited_level
var current_level
var player_global_position : Vector2
var player_vec_position : Vector2
var detected_entities : bool = false

#func _process(_delta: float) -> void:
#	if player_global_position:
#		print(player_global_position)
#		print(player_vec_position)
