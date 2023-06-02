extends StaticBody2D

@export var player : CharacterBody2D
@export var player_position : Marker2D
@export var player_vec_position : Vector2

var is_player_in_zone : bool = false

func _process(_delta):
	if is_player_in_zone:
		if Input.is_action_just_pressed("interact"):
			if player && player_position:
				TransitionState.ChangeScenes(TransitionState.transition.TRANSITION_IN)
				player.set_transform(player_position.get_transform())
				TransitionState.ChangeScenes(TransitionState.transition.TRANSITION_OUT)
			else:
				print_debug("error: One of Two Nodes are can't be found")


func _on_player_detector_area_entered(_area):
	is_player_in_zone = true


func _on_player_detector_area_exited(_area):
	is_player_in_zone = false
