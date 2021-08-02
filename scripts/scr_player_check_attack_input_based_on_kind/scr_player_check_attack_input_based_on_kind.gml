/// @description Check for player attack input based on player type
function scr_player_check_attack_input_based_on_kind(){
	switch player_buttons_identifier {
		case buttons_identifier.left_group:
			if obj_game_buttons_controller.buttons_leftgroup_attack_key_input {
				player_last_state = player_current_state;
				player_current_state = player_states.attack;
			}
			break;
		case buttons_identifier.right_group:
			if obj_game_buttons_controller.buttons_rightgroup_attack_key_input {
				player_last_state = player_current_state;
				player_current_state = player_states.attack;
			}
			break;
	}
}