extends Area2D

signal hit

export (int) var SPEED
var velocity = Vector2()
var screensize

func _ready():
	hide()
	screensize = get_viewport_rect().size
	
func start(pos):
	position = pos
	show()
	$Collision.disabled = false
			
func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)

	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0

func _on_Player_body_entered( body ):
	$Collision.disabled = true
	hide()
	emit_signal("hit")


