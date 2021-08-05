/// @description Handle the player spawn object update

if room == rm_game_test { // Only handle player spawner if it's on main game room
	var player_one_target = global.camera_view_targets[0];

	if player_spawner_first_button_group != -1 and player_spawner_first_character != -1 {
		if player_one_target == noone { // Generate first player if it doesn't exists
			var player_one = instance_create_layer(200, 100, "Collision_Layer", obj_player_controller);
			player_one.player_type = player_spawner_first_character;
			player_one.player_buttons_identifier = player_spawner_first_button_group;
			global.camera_view_targets[0] = player_one.id;
			if player_one.player_buttons_identifier == buttons_identifier.left_group { // Change gamepad buttons group based on generated player one buttons group
				global.gamepad_one_buttons_group = buttons_identifier.left_group;
				global.gamepad_two_buttons_group = buttons_identifier.right_group;
			} else if player_one.player_buttons_identifier == buttons_identifier.right_group {
				global.gamepad_one_buttons_group = buttons_identifier.right_group;
				global.gamepad_two_buttons_group = buttons_identifier.left_group;
			}
		}
	}

	// Summon second player if it's not already summoned
	if global.camera_view_targets[1] == noone and player_one_target != noone {
		if player_one_target.player_buttons_identifier == buttons_identifier.left_group and obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input {
			var player_two = instance_create_layer(250, 100, "Collision_Layer", obj_player_controller);
			switch player_one_target.player_type {
				case player_kind.robot_samurai:
					player_two.player_type = player_kind.panda;
					break;
				case player_kind.panda:
					player_two.player_type = player_kind.robot_samurai;
					break;
			}
			player_two.player_buttons_identifier = buttons_identifier.right_group;
			global.camera_view_targets[1] = player_two.id;
			global.highscore_show_two_players = true;
		} else if player_one_target.player_buttons_identifier == buttons_identifier.right_group and obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input {
			var player_two = instance_create_layer(250, 100, "Collision_Layer", obj_player_controller);
			switch player_one_target.player_type {
				case player_kind.robot_samurai:
					player_two.player_type = player_kind.panda;
					break;
				case player_kind.panda:
					player_two.player_type = player_kind.robot_samurai;
					break;
			}
			player_two.player_buttons_identifier = buttons_identifier.left_group;
			global.camera_view_targets[1] = player_two.id;
			global.highscore_show_two_players = true;
		}
	}
}