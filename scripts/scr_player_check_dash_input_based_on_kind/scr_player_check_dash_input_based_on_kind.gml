/// @description Check for player movement input based on player type
function scr_player_check_dash_input_based_on_kind(){
	switch player_type {
		case player_kind.samurai:
			if obj_game_buttons_controller.buttons_samurai_dashtalk_key_input {
				player_is_dashing = true;
				player_current_dash_delay = player_max_dash_delay;
			}
			break;
		case player_kind.ninja:
			if obj_game_buttons_controller.buttons_ninja_dashtalk_key_input {
				player_is_dashing = true;
				player_current_dash_delay = player_max_dash_delay;
			}
			break;
	}
}