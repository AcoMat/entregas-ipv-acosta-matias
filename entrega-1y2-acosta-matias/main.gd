extends Node

@export var bullet_scene: PackedScene
var bullet_velocity = 200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_player_shoot() -> void:
	var new_bullet = bullet_scene.instantiate()
	new_bullet.position = $Player.position
	# new_bullet.linear_velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	add_child(new_bullet)
