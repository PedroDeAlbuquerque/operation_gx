/// @description Check for player movement input based on player buttons identifier
function scr_player_check_movement_input_based_on_kind(){
	var final_speed = player_base_speed;
	if player_type == player_kind.panda { // Reduce base speed if player type is panda
		final_speed--;
	}
	if player_is_dashing { // Double player speed while dashing
		final_speed = player_base_speed * 2;
	}
	
	switch player_buttons_identifier {
		case buttons_identifier.left_group: // Handle left group buttons player movement input
			if obj_game_buttons_controller.buttons_leftgroup_left_key_input {
				player_horizontal_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_leftgroup_right_key_input {
				player_horizontal_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_leftgroup_left_key_input and !obj_game_buttons_controller.buttons_leftgroup_right_key_input) or 
				(obj_game_buttons_controller.buttons_leftgroup_left_key_input and obj_game_buttons_controller.buttons_leftgroup_right_key_input)
				) {
				player_horizontal_speed = 0;
			}
			if obj_game_buttons_controller.buttons_leftgroup_up_key_input {
				player_vertical_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_leftgroup_down_key_input {
				player_vertical_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_leftgroup_up_key_input and !obj_game_buttons_controller.buttons_leftgroup_down_key_input) or 
				(obj_game_buttons_controller.buttons_leftgroup_up_key_input and obj_game_buttons_controller.buttons_leftgroup_down_key_input)
				) {
				player_vertical_speed = 0;
			}
			break;
		case buttons_identifier.right_group: // Handle right group buttons player movement input
			if obj_game_buttons_controller.buttons_rightgroup_left_key_input {
				player_horizontal_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_rightgroup_right_key_input {
				player_horizontal_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_rightgroup_left_key_input and !obj_game_buttons_controller.buttons_rightgroup_right_key_input) or 
				(obj_game_buttons_controller.buttons_rightgroup_left_key_input and obj_game_buttons_controller.buttons_rightgroup_right_key_input)
				) {
				player_horizontal_speed = 0;
			}
			if obj_game_buttons_controller.buttons_rightgroup_up_key_input {
				player_vertical_speed = -final_speed;
			}
			if obj_game_buttons_controller.buttons_rightgroup_down_key_input {
				player_vertical_speed = final_speed;
			}
			if (
				(!obj_game_buttons_controller.buttons_rightgroup_up_key_input and !obj_game_buttons_controller.buttons_rightgroup_down_key_input) or 
				(obj_game_buttons_controller.buttons_rightgroup_up_key_input and obj_game_buttons_controller.buttons_rightgroup_down_key_input)
				) {
				player_vertical_speed = 0;
			}
			break;
	}
}