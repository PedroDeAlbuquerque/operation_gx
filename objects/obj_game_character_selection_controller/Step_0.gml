/// @description Handle the character selection update

switch obj_game_player_spawner.player_spawner_first_button_group {
	case buttons_identifier.left_group:
		switch character_selection_player_kind {
			case player_kind.robot_samurai:
				if obj_game_buttons_controller.buttons_leftgroup_right_key_input {
					character_selection_player_kind = player_kind.panda;
				}
				break;
			case player_kind.panda:
				if obj_game_buttons_controller.buttons_leftgroup_left_key_input {
					character_selection_player_kind = player_kind.robot_samurai;
				}
				break;
		}
		
		if obj_game_buttons_controller.buttons_leftgroup_attack_key_input {
			obj_game_player_spawner.player_spawner_first_character = character_selection_player_kind;
			room_goto_next();
		}
		
		if obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input {
			room_goto_previous();
		}
		break;
	case buttons_identifier.right_group:
		switch character_selection_player_kind {
			case player_kind.robot_samurai:
				if obj_game_buttons_controller.buttons_rightgroup_right_key_input {
					character_selection_player_kind = player_kind.panda;
				}
				break;
			case player_kind.panda:
				if obj_game_buttons_controller.buttons_rightgroup_left_key_input {
					character_selection_player_kind = player_kind.robot_samurai;
				}
				break;
		}
		
		if obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input {
			obj_game_player_spawner.player_spawner_first_character = character_selection_player_kind;
			room_goto_next();
		}
		
		if obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input {
			room_goto_previous();
		}
		break;
}