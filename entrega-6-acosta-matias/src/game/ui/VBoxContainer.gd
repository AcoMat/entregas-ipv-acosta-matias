extends VBoxContainer

func _ready():
	var container = VBoxContainer.new()
	add_child(container)

	for action_name in InputMap.get_actions():
		var events = InputMap.get_action_list(action_name)
		for event in events:
			if event is InputEventKey:
				var label = Label.new()
				label.text = "%s: %s" % [action_name, OS.get_scancode_string(event.scancode)]
				container.add_child(label)
