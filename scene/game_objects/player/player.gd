extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var max_speed = 100
var acceleration = 0.125

@warning_ignore("unused_parameter")
func _process(delta):
	var direction = movement_vector().normalized()
	var target_velocity = max_speed * direction
	
	velocity = velocity.lerp(target_velocity, acceleration)
	move_and_slide()
	
	if direction.x != 0 || direction.y != 0:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
	
	var face_sign = sign(direction.x)
	if face_sign != 0:
		animated_sprite_2d.scale.x = face_sign


func movement_vector():
	var movement_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movement_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(movement_x, movement_y)
