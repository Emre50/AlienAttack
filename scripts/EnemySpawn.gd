extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

@onready var spawn_position = $SpawnPoint

signal enemy_spawn(enemy_instance)
signal path_enemy_spawn(path_enemy_instance)

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var spawn_position_array = spawn_position.get_children()
	var random_spawny_point = spawn_position_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawny_point.global_position
	#add_child(enemy_instance)
	emit_signal("enemy_spawn", enemy_instance)

func _on_path_enemy_timer_timeout():
	spawn_path_enemy()

func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawn", path_enemy_instance)
