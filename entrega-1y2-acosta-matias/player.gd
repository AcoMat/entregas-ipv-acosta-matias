extends Node2D

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Player created")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += (int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))) * speed * delta
	$GunSprite.look_at(get_global_mouse_position())
	if(Input.is_action_pressed("player_shoot")):
		shoot()


func shoot():
	if($ShootColdown.is_stopped()):
		print("shoot")
		$ShootColdown.start()
	else:
		print("no shoot")
