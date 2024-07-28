extends Control

@onready var score = $score
@onready var left_live = $live

func score_label(new_score):
	score.text = "SCORE: " + str(new_score)

func set_lives(amount):
	left_live.text = str(amount)
