extends Area2D

@export var speed = 300
@onready var notifier = $VisibleOnScreenNotifier2D

func _ready():
	notifier.connect("screen_exited", _on_visible_on_screen_notifier_2d_screen_exited)

func _physics_process(delta):
	global_position.x += speed*delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_area_entered(area):
	queue_free()
	area.die()
