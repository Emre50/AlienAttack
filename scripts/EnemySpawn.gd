extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_position = $SpawnPoint
signal enemy_spawn(enemy_instance)

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var spawn_position_array = spawn_position.get_children()
	var random_spawny_point = spawn_position_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawny_point.global_position
	#add_child(enemy_instance)
	emit_signal("enemy_spawn", enemy_instance)

