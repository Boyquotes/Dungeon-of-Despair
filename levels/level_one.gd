extends Node2D

@onready var player : CharacterBody2D = $Player

func _ready() -> void:
	Global.current_level = self.name
	if Global.visited_level != null:
		if player:
			player.set_transform(get_node(Global.visited_level + "Pos").get_transform())
