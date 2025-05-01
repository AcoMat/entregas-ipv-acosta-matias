extends Node2D

var direction
var speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await $DespawnTimer.timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta

func init(_direction: Vector2, _speed: float) -> void:
	direction = _direction.normalized()
	speed = _speed
