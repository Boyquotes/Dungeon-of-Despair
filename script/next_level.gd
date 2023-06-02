extends Area2D

@export var scene_path : String = ""

func _on_body_entered(body: Node2D) -> void:
	if body:
		if scene_path:
			Global.visited_level = get_parent().name
			print("Visited Level: " + Global.visited_level)
			TransitionState.ChangeScenes(TransitionState.transition.TRANSITION_IN)
			get_tree().change_scene_to_file(scene_path)
			TransitionState.ChangeScenes(TransitionState.transition.TRANSITION_OUT)
