extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.set_projectile_container(self)
	$Torret.projectile_container = self
	$Torret2.projectile_container = self
	$Torret.player = $Player
	$Torret2.player = $Player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
