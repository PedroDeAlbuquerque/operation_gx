/// @description Handle the title screen input

if obj_game_buttons_controller.buttons_leftgroup_attack_key_input or ((global.gamepad_one_identifier != noone) and keyboard_check(ord("H"))) {
	with obj_game_player_spawner {
		player_spawner_first_button_group = buttons_identifier.left_group;
	}
	global.gamepad_one_buttons_group = buttons_identifier.left_group;
	global.gamepad_two_buttons_group = buttons_identifier.right_group;
	obj_game_buttons_controller.buttons_leftgroup_attack_key_input = false;
	room_goto_next();
}
if obj_game_buttons_controller.buttons_rightgroup_attack_key_input and global.gamepad_two_identifier == noone {
	with obj_game_player_spawner {
		player_spawner_first_button_group = buttons_identifier.right_group;
	}
	obj_game_buttons_controller.buttons_rightgroup_attack_key_input = false;
	global.gamepad_one_buttons_group = buttons_identifier.right_group;
	global.gamepad_two_buttons_group = buttons_identifier.left_group;
	room_goto_next();
}