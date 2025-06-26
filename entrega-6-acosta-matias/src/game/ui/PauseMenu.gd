extends Control

## Menú de pausa genérico, abierto utilizando la acción "pause_menu"
## (por default la tecla Esc).

signal return_selected()

export var main_menu: PackedScene

func _ready() -> void:
	hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("pause_menu"):
		visible = !visible


func _on_ResumeButton_pressed() -> void:
	hide()


func _on_OptionsButton_pressed():
	$OptionsMenu.show()


func _on_MenuButton_pressed():
	hide()
	emit_signal("return_selected")
