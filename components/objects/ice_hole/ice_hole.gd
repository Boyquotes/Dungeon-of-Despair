extends Area2D

@export var player : CharacterBody2D
@export var respawn_point : Marker2D

func _on_body_entered(_body):
	if player && respawn_point:
		TransitionState.ChangeScenes(TransitionState.transition.TRANSITION_IN)
		player.set_transform(respawn_point.get_transform())
		TransitionState.ChangeScenes(TransitionState.transition.TRANSITION_OUT)
