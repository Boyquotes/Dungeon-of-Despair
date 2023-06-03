extends CanvasLayer

@onready var animation_player : AnimationPlayer = $AnimationPlayer

enum transition {
	TRANSITION_OUT,
	TRANSITION_IN,
	LETTERBOXING_IN,
	LETTERBOXING_OUT
}
func ChangeScenes(transitions):
	if transitions != null:
		#transitions in and out
		if transitions == transition.TRANSITION_IN:
			animation_player.play("transition_in")
		elif transitions == transition.TRANSITION_OUT:
			animation_player.play("transition_out")
		
		#transitions for letterboxing / black_bar
		if transitions == transition.LETTERBOXING_IN:
			animation_player.play("letterboxing_in")
		elif transitions == transition.LETTERBOXING_OUT:
			animation_player.play("letterboxing_out")
		#thread if finished read next line of code
		await animation_player.animation_finished
