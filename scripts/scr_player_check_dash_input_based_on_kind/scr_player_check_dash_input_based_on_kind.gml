/// @description Check for player dash input based on player buttons identifier
function scr_player_check_dash_input_based_on_kind(){
	switch player_buttons_identifier {
		case buttons_identifier.left_group:
			if obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input {
				player_is_dashing = true;
				player_current_dash_delay = player_max_dash_delay;
			}
			break;
		case buttons_identifier.right_group:
			if obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input {
				player_is_dashing = true;
				player_current_dash_delay = player_max_dash_delay;
			}
			break;
	}
}