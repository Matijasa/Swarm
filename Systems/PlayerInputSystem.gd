extends Node

@export var speed: float = 400.0

func _physics_process(delta):
	# DEBUG 1: Is the system even running?
	# (Uncomment the line below if you suspect the Autoload is broken, 
	# but it will spam your console!)
	# print("System is running...")

	var player_node = get_tree().get_first_node_in_group("player")
		
	if player_node:
		# DEBUG 2: We found the player!
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		
		# DEBUG 3: Are keys being registered?
		if direction != Vector2.ZERO:
			print("Input detected: ", direction)
			
		player_node.input_component.input_direction = direction
		player_node.velocity = player_node.input_component.input_direction * speed
		player_node.move_and_slide()
	else:
		# DEBUG 4: The system is running, but CANNOT find the player
		print("ERROR: No node found in group 'player'!")
