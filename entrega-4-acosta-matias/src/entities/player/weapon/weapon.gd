extends Node2D

@export var projectile_scene: PackedScene
@export var worldScene: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target_position = get_global_mouse_position()
	look_at(target_position)

func shoot():
	if $WeaponCooldown.is_stopped():
		$WeaponCooldown.start()
		genProjectile()
		startWeaponAnim()
	else:
		pass
		
func genProjectile():
	var new_projectile: Node2D = projectile_scene.instantiate()
	worldScene.add_child(new_projectile)
	new_projectile.global_position = $WeaponTip.global_position
	var direction: Vector2 = (get_global_mouse_position() - $WeaponTip.global_position)
	new_projectile.init(direction)

func startWeaponAnim():
	$WeaponAnim.visible = true
	$WeaponAnim.play("shoot")

func _on_weapon_anim_animation_finished() -> void:
	$WeaponAnim.stop()
	$WeaponAnim.hide()
