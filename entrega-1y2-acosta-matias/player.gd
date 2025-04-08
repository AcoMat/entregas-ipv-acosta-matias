extends Node2D

var player_speed = 500
var projectile_container

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func set_projectile_container(container: Node):
	$Cannon.projectile_container = container
	projectile_container = container

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += player_speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= player_speed
	position += velocity * delta
	
	if(Input.is_action_pressed("player_shoot")):
		$Cannon.shoot()
		
	$Cannon.look_at(get_global_mouse_position())
	
	
