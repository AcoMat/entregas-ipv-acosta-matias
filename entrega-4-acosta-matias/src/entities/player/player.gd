extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	$Weapon.worldScene = get_parent()
	add_to_group("player")
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Handle animations with priority
	if not is_on_floor():
		if velocity.y < 0:
			if $AnimatedSprite2D.animation != "jump":
				$AnimatedSprite2D.play("jump")
		elif velocity.y > 0:
			if $AnimatedSprite2D.animation != "fall":
				$AnimatedSprite2D.play("fall")
	elif direction:
		if $AnimatedSprite2D.animation != "run":
			$AnimatedSprite2D.play("run")
	else:
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")

	if Input.is_action_pressed("fire_cannon"):
		$Weapon.shoot()
		
	move_and_slide()

func die():
	queue_free()
