/// @description Handle the title screen input

if obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input or ((global.gamepad_one_identifier != noone) and keyboard_check(ord("H"))) {
	with obj_game_player_spawner {
		player_spawner_first_button_group = buttons_identifier.left_group;
		player_spawner_first_character = player_kind.robot_samurai;
	}
	room_goto_next();
}
if obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input and global.gamepad_two_identifier == noone {
	with obj_game_player_spawner {
		player_spawner_first_button_group = buttons_identifier.right_group;
		player_spawner_first_character = player_kind.panda;
	}
	room_goto_next();
}