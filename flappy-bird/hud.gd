extends CanvasLayer


func update_score(score):
	$ScoreLabel.text = str(score)


func show_game_over():
	$GameOverLabel.show()
