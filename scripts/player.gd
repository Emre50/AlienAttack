extends CharacterBody2D

var speed = 300
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer #get_node("RocketContainer")
@onready var rocket_sound = $RocketSound
signal damage

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	
	movement()
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2.ZERO,screen_size)
	
func shoot():
		var rocket_instance = rocket_scene.instantiate()
		rocket_container.add_child(rocket_instance)
		rocket_instance.global_position = global_position
		rocket_instance.global_position.x += 100
		rocket_sound.play()

func take_damage():
	emit_signal("damage")

func die():
	queue_free()

func movement():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x = speed
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed
	elif Input.is_action_pressed("up"):
		velocity.y = -speed
