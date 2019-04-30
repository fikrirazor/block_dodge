extends Area2D

signal hit

export (int) var SPEED
var velocity = Vector2()
var screensize
var anim = ""

func _ready():
	hide()
	screensize = get_viewport_rect().size


func start(pos):
	position = pos
	show()
	$Collision.disabled = false
			
func _process(delta):
	velocity = Vector2()
	var state = "idle"
	var press_right = Input.is_action_pressed("ui_right")
	var press_left = Input.is_action_pressed("ui_left")
	
	# Move Left or right
	if press_right:
		velocity.x += 1
		state = "right"
	if press_left: 
		velocity.x -= 1
		state = "left"
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play(state)
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	if(state != anim):
		anim = state

func _on_Player_body_entered( body ):
	$Collision.disabled = true
	hide()
	emit_signal("hit")



