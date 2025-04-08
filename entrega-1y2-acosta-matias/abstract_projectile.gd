extends Node2D
class_name Projectile

var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)


func set_starting_values(starting_position: Vector2, direction: Vector2):
	global_position = starting_position
	self.direction = direction
	rotate(direction.angle())
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction*500*delta


func _on_duration_timeout() -> void:
	queue_free()
