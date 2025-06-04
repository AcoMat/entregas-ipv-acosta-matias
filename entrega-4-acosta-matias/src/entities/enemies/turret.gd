extends Node2D

var current_objetive: Node2D = null
@export var projectile_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemies")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_detection_area_body_entered(body: Node2D) -> void:
	print("nuevo objetivo")
	print(body.global_position)
	current_objetive = body
	$FireTimer.start()

func shoot():
	if(current_objetive != null):
		var new_projectile: Node2D = projectile_scene.instantiate()
		get_parent().add_child(new_projectile)
		new_projectile.global_position = $FirePosition.global_position
		var direction: Vector2 = (current_objetive.position - $FirePosition.global_position)
		new_projectile.init(direction)

func _on_fire_timer_timeout() -> void:
	shoot()

func _on_detection_area_body_exited(body: Node2D) -> void:
	current_objetive = null
	$FireTimer.stop()
	
func die():
	queue_free()
