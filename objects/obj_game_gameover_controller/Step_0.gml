/// @description Handle gameover controller update

// Check input based on which player have gameover to reset game
if global.gameover_on_player_one {
	switch global.gamepad_one_buttons_group {
		case buttons_identifier.left_group:
			if obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input {
				scr_game_reset_globals();
				obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input = false;
				room_goto(rm_title_screen);
			}
			break;
		case buttons_identifier.right_group:
			if obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input {
				scr_game_reset_globals();
				obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input = false;
				room_goto(rm_title_screen);
			}
			break;
	}
}
if global.gameover_on_player_two {
	switch global.gamepad_two_buttons_group {
		case buttons_identifier.left_group:
			if obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input {
				scr_game_reset_globals();
				obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input = false;
				room_goto(rm_title_screen);
			}
			break;
		case buttons_identifier.right_group:
			if obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input {
				scr_game_reset_globals();
				obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input = false;
				room_goto(rm_title_screen);
			}
			break;
	}
}