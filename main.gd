extends Node

export (PackedScene) var enemy
var score

func _ready():
	randomize()
	

func new_game():
	score = 0
	$HUD.update_score(score)
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.menampilkan_pesan("Mulai")
	$Music.play()

func game_over():
	$DeathSound.play()
	$Music.stop()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.menampilkan_game_over()

func _on_StartTimer_timeout():
	$EnemyTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_EnemyTimer_timeout():
	$EnemyPath/EnemySpawnLocation.set_offset(randi())
	var enemy = preload("res://Enemy.tscn").instance()
	add_child(enemy)
	var direction = $EnemyPath/EnemySpawnLocation.rotation 
	enemy.position = $EnemyPath/EnemySpawnLocation.position
	enemy.rotation = direction
	enemy.set_linear_velocity(Vector2(rand_range(enemy.MIN_SPEED, enemy.MAX_SPEED), 0).rotated(direction))
	