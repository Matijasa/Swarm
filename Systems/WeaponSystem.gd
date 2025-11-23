extends Node

func _process(delta):
	# 1. FIND PLAYER
	var player = get_tree().get_first_node_in_group("player")
	if not player: return

	# Get the data
	var weapon = player.weapon_component
	var input = player.input_component # We need this to know direction!

	# 2. MANAGE COOLDOWN
	if weapon.cooldown_timer > 0:
		weapon.cooldown_timer -= delta

	# 3. CHECK INPUT & FIRE
	# "ui_accept" is Spacebar by default
	if Input.is_action_pressed("ui_accept"): 
		if weapon.cooldown_timer <= 0:
			fire(player, weapon, input.input_direction)

func fire(player_node, weapon_data, aim_direction):
	# Reset cooldown
	weapon_data.cooldown_timer = weapon_data.fire_rate

	# Spawn Bullet
	var bullet = weapon_data.bullet_scene.instantiate()

	# Set Position (Start at player center)
	bullet.global_position = player_node.global_position

	# Set Direction (If moving, shoot that way. If standing still, shoot Right)
	if aim_direction != Vector2.ZERO:
		bullet.direction = aim_direction
	else:
		bullet.direction = Vector2.RIGHT

	# Add to the Scene
	get_tree().current_scene.add_child(bullet)
