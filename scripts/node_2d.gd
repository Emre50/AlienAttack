extends Node2D

var lives: int = 3
var score = 0
@onready var player = $Player
@onready var hud = $ui/Control
@onready var ui = $ui
var game_over_screen = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.score_label(score)
	hud.set_lives(lives)

func _on_death_zone_area_entered(area):
	area.die()

func _on_player_damage():
	lives-=1
	hud.set_lives(lives)
	
	if (lives == 0):
		player.die()
		var gos = game_over_screen.instantiate()
		gos.set_score(score)
		ui.add_child(gos)
		

func _on_enemy_spawn_enemy_spawn(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)

func on_enemy_died():
	score += 100
	hud.score_label(score)
