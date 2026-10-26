extends Node2D

var pipe_scene = preload("res://pipe_pair.tscn")
var screen_size
var game_over = false
var score = 0 # NEW


func _ready():
	screen_size = get_viewport_rect().size
	$Player.position = Vector2(100, screen_size.y / 2)


func _process(delta):
	# plane touches the top or bottom of the screen
	if $Player.position.y > screen_size.y or $Player.position.y < 0:
		end_game()

	# press flap to restart after game over
	if game_over and Input.is_action_just_pressed("flap"):
		get_tree().reload_current_scene()


func _on_pipe_timer_timeout():
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(screen_size.x + 50, randf_range(200, screen_size.y - 200))
	pipe.add_to_group("pipes")
	pipe.hit.connect(end_game)
	pipe.scored.connect(add_score) # NEW
	add_child(pipe)


func add_score(): # NEW
	if game_over:
		return
	score += 1
	$HUD.update_score(score)


func end_game():
	if game_over:
		return
	game_over = true
	$PipeTimer.stop()
	$Player.set_physics_process(false)
	get_tree().call_group("pipes", "set_process", false)
	$HUD.show_game_over() # NEW
