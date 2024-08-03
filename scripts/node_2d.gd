extends Node2D

var lives: int = 3
var score = 0
@onready var player = $Player
@onready var hud = $ui/Control
@onready var ui = $ui
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_damage = $PlayerDamage
@onready var health_bar = $HealthBar
var game_over_screen = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.score_label(score)
	hud.set_lives(lives)
	health_bar.value = lives

func _on_death_zone_area_entered(area):
	area.die()
	score -= 100
	hud.score_label(score)

func _on_player_damage():
	lives-=1
	health_bar.value = lives
	score -=100
	hud.score_label(score)
	hud.set_lives(lives)
	player_damage.play()
	
	if (lives == 0):
		player.die()
		var gos = game_over_screen.instantiate()
		gos.set_score(score)
		ui.add_child(gos)
		

func _on_enemy_spawn_enemy_spawn(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_spawn_path_enemy_spawn(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", on_enemy_died)

func on_enemy_died():
	score += 100
	hud.score_label(score)
	enemy_hit_sound.play()



