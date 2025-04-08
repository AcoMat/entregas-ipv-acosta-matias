extends Node2D

@export var projectile_scene: PackedScene
var projectile_container:Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func shoot():
	if $ShootColdown.is_stopped():
		$ShootColdown.start()
		var new_shoot:Projectile = projectile_scene.instantiate()
		projectile_container.add_child(new_shoot)
		new_shoot.set_starting_values($Marker2D.global_position, ($Marker2D.global_position - global_position).normalized())
