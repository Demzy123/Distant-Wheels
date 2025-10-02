extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var health_component = $health_component



var max_speed = 50
var kill_exp = 1

func _process(delta):
	var direction = get_direction_to_player()
	velocity = max_speed * direction
	move_and_slide()
	
	if direction.x != 0 || direction.y != 0:
		animated_sprite_2d.play("walk")
	
	var face_sign = sign(direction.x)
	if face_sign != 0:
		animated_sprite_2d.scale.x = face_sign

func get_direction_to_player():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player != null:
		return (player.global_position - global_position).normalized()
	return Vector2.ZERO

func _ready():
	(health_component as HealthComponent).died.connect(on_died)

func on_died():
	Global.experience_kill.emit(kill_exp)

	
