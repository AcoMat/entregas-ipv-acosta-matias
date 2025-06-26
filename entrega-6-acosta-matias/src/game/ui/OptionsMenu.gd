extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_ResumeButton_pressed():
	hide()


func _on_ControlsButton_pressed():
	$Panel.hide()
	$OptionsPanel.show()


func _on_BackOptionsButton_pressed():
	$Panel.show()
	$OptionsPanel.hide()
	
