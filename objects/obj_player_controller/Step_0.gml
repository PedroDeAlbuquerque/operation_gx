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
		break;
	case player_states.talk:
		break;
	case player_states.death:
		break;
}

// Handle player dash input and it's normalization
if player_current_dash_delay <= 0 and player_current_state == player_states.sprint { // Only check for input if current dash delay is decreased enough and player current state does match
	scr_player_check_dash_input_based_on_kind();
} else { // Decrease current dash delay to handle dash input in the future and normalize current dashing
	player_current_dash_delay--;	
	
	if player_current_dash_delay <= 15 or player_current_state != player_states.sprint { // Normalize dash if delay is decreased enough or player current state doesn't match
		player_is_dashing = false;
	}
}

// Handle player movement and collision based on horizontal and vertical speed
scr_player_check_movement_input_based_on_kind();

repeat(abs(player_horizontal_speed)) {
	x += sign(player_horizontal_speed);
}
repeat(abs(player_vertical_speed)) {
	y += sign(player_vertical_speed);
}