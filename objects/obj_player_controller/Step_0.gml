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
		break;
	case player_states.sprint_end:
		break;
	case player_states.attack:
		break;
	case player_states.dash:
		break;
	case player_states.talk:
		break;
	case player_states.death:
		break;
}

// Handle player movement and collision based on horizontal and vertical speed
scr_player_check_movement_input_based_on_kind();

repeat(abs(player_horizontal_speed)) {
	x += sign(player_horizontal_speed);
}
repeat(abs(player_vertical_speed)) {
	y += sign(player_vertical_speed);
}