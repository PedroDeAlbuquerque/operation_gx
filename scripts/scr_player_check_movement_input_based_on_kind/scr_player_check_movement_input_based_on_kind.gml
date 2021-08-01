/// @description Check for player movement input based on player type
function scr_player_check_movement_input_based_on_kind(){
	var final_speed = player_base_speed;
	if player_is_dashing {
		final_speed = player_base_speed * 2;
	}
	
	switch player_type {
		case player_kind.samurai: // Handle samurai player movement input
			if obj_game_buttons_controller.buttons_samurai_left_key_input {
				player_horizontal_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_samurai_right_key_input {
				player_horizontal_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_samurai_left_key_input and !obj_game_buttons_controller.buttons_samurai_right_key_input) or 
				(obj_game_buttons_controller.buttons_samurai_left_key_input and obj_game_buttons_controller.buttons_samurai_right_key_input)
				) {
				player_horizontal_speed = 0;
			}
			if obj_game_buttons_controller.buttons_samurai_up_key_input {
				player_vertical_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_samurai_down_key_input {
				player_vertical_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_samurai_up_key_input and !obj_game_buttons_controller.buttons_samurai_down_key_input) or 
				(obj_game_buttons_controller.buttons_samurai_up_key_input and obj_game_buttons_controller.buttons_samurai_down_key_input)
				) {
				player_vertical_speed = 0;
			}
			break;
		case player_kind.ninja: // Handle ninja player movement input
			if obj_game_buttons_controller.buttons_ninja_left_key_input {
				player_horizontal_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_ninja_right_key_input {
				player_horizontal_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_ninja_left_key_input and !obj_game_buttons_controller.buttons_ninja_right_key_input) or 
				(obj_game_buttons_controller.buttons_ninja_left_key_input and obj_game_buttons_controller.buttons_ninja_right_key_input)
				) {
				player_horizontal_speed = 0;
			}
			if obj_game_buttons_controller.buttons_ninja_up_key_input {
				player_vertical_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_ninja_down_key_input {
				player_vertical_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_ninja_up_key_input and !obj_game_buttons_controller.buttons_ninja_down_key_input) or 
				(obj_game_buttons_controller.buttons_ninja_up_key_input and obj_game_buttons_controller.buttons_ninja_down_key_input)
				) {
				player_vertical_speed = 0;
			}
			break;
	}
}