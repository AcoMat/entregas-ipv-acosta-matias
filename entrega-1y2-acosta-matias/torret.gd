extends Node2D

@export var projectile_scene: PackedScene
var projectile_container: Node
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ShootColdown.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shoot_coldown_timeout() -> void:
	print("Disparo")
	var new_shoot:Projectile = projectile_scene.instantiate()
	projectile_container.add_child(new_shoot)
	new_shoot.set_starting_values(global_position, (player.global_position - global_position).normalized())
