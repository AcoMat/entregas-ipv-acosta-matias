extends Node2D

var activated = false
var target:PhysicsBody2D

@export var worldScene: Node2D
@export var projectileScene: PackedScene
@export var shoot_force: float = 600

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(activated):
		look_at(target.global_position)
		shoot()


func _on_area_2d_body_entered(body: Node2D) -> void:
	look_at(body.global_position)
	target = body
	activated = true
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	if($Area2D.has_overlapping_bodies()):
		pass
	else:
		activated = false

func shoot() -> void:
	if($ShootCooldown.is_stopped()):
		print("SHOOT")
		var new_projectile: Node2D = projectileScene.instantiate()
		worldScene.add_child(new_projectile)
		new_projectile.global_position = $Muzzle.global_position
		var direction: Vector2 = (global_position - $Muzzle.global_position)
		new_projectile.init(direction,shoot_force)
		$ShootCooldown.start()
	else:
		pass
