/// @description Handle player object update

// Handle player action based on player current state
switch player_current_state {
	case player_states.idle:
		if player_horizontal_speed != 0 or player_vertical_speed != 0 {
			player_last_state = player_current_state;
			player_current_state = player_states.sprint;
		}
		break;
	case player_states.sprint:
		if player_horizontal_speed == 0 and player_vertical_speed == 0 {
			player_last_state = player_current_state;
			player_current_state = player_states.idle;
		}
		break;
	case player_states.attack:
		if not player_sword_combo_is_being_executed { // Only stop player movement if it's not executing the sword attack combo
			player_horizontal_speed = 0;
			player_vertical_speed = 0;
		}
		break;
	case player_states.talk:
		break;
	case player_states.death:
		break;
}

if player_current_state != player_states.death { // Only handle logic based on input if player is alive
	// Handle player attack input
	if player_current_state != player_states.attack { // Only check for player attack input if player is not attacking
		scr_player_check_attack_input_based_on_kind();
	
		// Normalize player attack variables if player is not attacking
		switch player_type {
			case player_kind.robot_samurai:
				if player_sword_hitbox != -1 and instance_exists(player_sword_hitbox) {
					instance_destroy(player_sword_hitbox);
				}
				player_sword_hitbox = -1;
				player_sword_combo_timer = player_sword_combo_max_timer;
				player_sword_combo_is_being_executed = false;
				break;
			case player_kind.panda:
				player_bullet_shot_is_executed = false;
				break;
		}
	}

	// Handle player dash input and it's normalization
	if player_type == player_kind.robot_samurai { // Only handle dash if player type is robot samurai
		if player_current_dash_delay <= 0 and player_current_state == player_states.sprint { // Only check for input if current dash delay is decreased enough and player current state does match
			scr_player_check_dash_input_based_on_kind();
		} else { // Decrease current dash delay to handle dash input in the future and normalize current dashing
			player_current_dash_delay--;	
	
			if player_current_dash_delay <= 15 or (player_current_state != player_states.sprint and player_current_state != player_states.attack) { // Normalize dash if delay is decreased enough or player current state doesn't match
				player_is_dashing = false;
			}
		}
	}

	// Handle player movement and collision based on horizontal and vertical speed
	if player_current_state != player_states.attack {
		scr_player_check_movement_input_based_on_kind();
	}
}

repeat(abs(player_horizontal_speed)) {
	x += sign(player_horizontal_speed);
}
repeat(abs(player_vertical_speed)) {
	y += sign(player_vertical_speed);
}