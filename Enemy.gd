extends RigidBody2D

export (int) var MIN_SPEED
export (int) var MAX_SPEED
var enemy_types = ["rotate"]

func _ready():
	$AnimatedSprite.animation = enemy_types[randi() % enemy_types.size()]
	

func _on_Visibility_screen_exited():
	queue_free()
