extends CharacterBody2D

@export var SPEED : float = 90
@export var player_position : Vector2

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var keyboard_sprite : Sprite2D = $KeyboardHelp
@onready var object_detection : Area2D = $ObjectDetection
@onready var icy_surface : ShapeCast2D = $IcyDetector

func _ready():
	animation_tree["parameters/Idle/blend_position"] = player_position
	animation_tree.active = true

func _process(_delta):
	player_animation_parameters()
	Global.player_global_position = self.position

func _physics_process(_delta):
	var input_direction : Vector2 = Vector2.ZERO
	
	if input_direction.y == 0:
		input_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if input_direction.x == 0:
		input_direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
		
	Global.player_vec_position = input_direction

	if icy_surface.is_colliding():
		if velocity == Vector2.ZERO:
			velocity += velocity.lerp(input_direction * SPEED, 1)
	else:
		velocity = input_direction * SPEED
	
	move_and_slide()


func player_animation_parameters():
	if velocity == Vector2.ZERO:
		animation_tree["parameters/conditions/idling"] = true
		animation_tree["parameters/conditions/walking"] = false
		animation_tree["parameters/conditions/slippery"] = false
	else:
		animation_tree["parameters/conditions/idling"] = false
		if icy_surface.is_colliding():
			animation_tree["parameters/conditions/slippery"] = true
		else:
			animation_tree["parameters/conditions/walking"] = true
	
	if velocity != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = velocity
		animation_tree["parameters/Walk/blend_position"] = velocity
		animation_tree["parameters/Slippery/blend_position"] = velocity

func keyboard_help(detection : bool) -> void:
	keyboard_sprite.visible = detection


func _on_object_detection_body_entered(_body):
	print("Object Detected")
	keyboard_help(true)
	Global.detected_entities = true


func _on_object_detection_body_exited(_body):
	print("Object Detection Disable")
	keyboard_help(false)
	Global.detected_entities = false
