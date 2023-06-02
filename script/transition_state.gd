extends CanvasLayer

@onready var animation_player : AnimationPlayer = $AnimationPlayer

enum transition {
	TRANSITION_OUT,
	TRANSITION_IN
}
func ChangeScenes(transitions):
	if transitions != null:
		if transitions == transition.TRANSITION_IN:
			animation_player.play("transition_in")
			await animation_player.animation_finished
		elif transitions == transition.TRANSITION_OUT:
			animation_player.play("transition_out")
			await animation_player.animation_finished
