extends Node2D

var direction
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta

func init(_direction: Vector2) -> void:
	direction = _direction.normalized()
	rotate(_direction.angle())

func _on_lifetime_timer_timeout() -> void:
	queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.is_in_group("enemies"):
		body.die()
	queue_free()
