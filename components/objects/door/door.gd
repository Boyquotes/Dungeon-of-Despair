extends StaticBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

var is_player_in_zone : bool = false

func _ready():
	if Global.is_door_opened:
		animation_player.play("opened")

func _physics_process(_delta):
	if is_player_in_zone:
		if Input.is_action_just_pressed("interact"):
			#Global.is_door_opened = true
			#is_player_in_zone = false
			#animation_player.play("open_gate")
			pass

func _on_player_detector_area_entered(_area):
	is_player_in_zone = true


func _on_player_detector_area_exited(_area):
	is_player_in_zone = false
