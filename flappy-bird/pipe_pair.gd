extends Node2D

signal hit
signal scored

const SPEED = 150.0


func _process(delta):
	position.x -= SPEED * delta
	if position.x < -100:
		queue_free()


func _on_top_pipe_body_entered(body):
	hit.emit()


func _on_bottom_pipe_body_entered(body):
	hit.emit()


func _on_score_zone_body_entered(body):
	scored.emit()
