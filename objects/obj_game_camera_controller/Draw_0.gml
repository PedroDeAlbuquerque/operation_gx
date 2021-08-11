/// @description Handle the highscore drawing

// Set drawing font
if room == rm_main { // Only draw highscore if it's on main game screen
	draw_set_font(fnt_dialog_text);

	// Handle highscore drawing based on current view and number of players
	if view_visible[0] {
		if view_current == 0 {
			draw_text(camera_get_view_x(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + 10, "HIGHSCORE: " + string(camera_highscore_left_view));
			var player_one_target = global.camera_view_targets[0];
			if player_one_target != noone {
				if player_one_target.player_type == player_kind.robot_samurai {
					for (var i = 1; i <= player_one_target.player_lives; i++) {
						draw_sprite(spr_player_robot_samurai_life, 0, camera_get_view_x(view_camera[0]) + 10 * i, camera_get_view_y(view_camera[0]) + 30);
					}
				} else if player_one_target.player_type == player_kind.panda {
					for (var i = 1; i <= player_one_target.player_lives; i++) {
						draw_sprite(spr_player_panda_life, 0, camera_get_view_x(view_camera[0]) + 10 * i, camera_get_view_y(view_camera[0]) + 30);
					}
				}
			}
			if global.highscore_show_two_players {
				draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 150), camera_get_view_y(view_camera[0]) + 10, "HIGHSCORE: " + string(camera_highscore_right_view));
				var player_two_target = global.camera_view_targets[1];
				if player_two_target != noone {
					if player_two_target.player_type == player_kind.robot_samurai {
						for (var i = 1; i <= player_two_target.player_lives; i++) {
							draw_sprite(spr_player_robot_samurai_life, 0, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 160) + (10 * i), camera_get_view_y(view_camera[0]) + 30);
						}
					} else if player_two_target.player_type == player_kind.panda {
						for (var i = 1; i <= player_two_target.player_lives; i++) {
							draw_sprite(spr_player_panda_life, 0, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 160) + (10 * i), camera_get_view_y(view_camera[0]) + 30);
						}
					}
				}
			} else {
				var player_one_target = global.camera_view_targets[0];
				var player_two_play_button_text = "";
				if global.gamepad_two_identifier == noone {
					if player_one_target != noone {
						if player_one_target.player_buttons_identifier == buttons_identifier.left_group {
							player_two_play_button_text = "'2'";
						} else if player_one_target.player_buttons_identifier == buttons_identifier.right_group {
							player_two_play_button_text = "'G'";
						}
					}
				} else {
					player_two_play_button_text = "gamepad 'A'";
				}
				draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 150), camera_get_view_y(view_camera[0]) + 10, "Press " + player_two_play_button_text + " to play");
			}
		}
	} else {
		if view_current == 0 {
			draw_text(camera_get_view_x(view_camera[1]) + 10, camera_get_view_y(view_camera[1]) + 10, "HIGHSCORE: " + string(camera_highscore_left_view));
			if global.player_one_is_on_left_view {
				var player_one_target = global.camera_view_targets[0];
				if player_one_target != noone {
					if player_one_target.player_type == player_kind.robot_samurai {
						for (var i = 1; i <= player_one_target.player_lives; i++) {
							draw_sprite(spr_player_robot_samurai_life, 0, camera_get_view_x(view_camera[1]) + 10 * i, camera_get_view_y(view_camera[1]) + 30);
						}
					} else if player_one_target.player_type == player_kind.panda {
						for (var i = 1; i <= player_one_target.player_lives; i++) {
							draw_sprite(spr_player_panda_life, 0, camera_get_view_x(view_camera[1]) + 10 * i, camera_get_view_y(view_camera[1]) + 30);
						}
					}
				}
			}
			if global.player_two_is_on_left_view {
				var player_two_target = global.camera_view_targets[1];
				if player_two_target != noone {
					if player_two_target.player_type == player_kind.robot_samurai {
						for (var i = 1; i <= player_two_target.player_lives; i++) {
							draw_sprite(spr_player_robot_samurai_life, 0, camera_get_view_x(view_camera[1]) + 10 * i, camera_get_view_y(view_camera[1]) + 30);
						}
					} else if player_two_target.player_type == player_kind.panda {
						for (var i = 1; i <= player_two_target.player_lives; i++) {
							draw_sprite(spr_player_panda_life, 0, camera_get_view_x(view_camera[1]) + 10 * i, camera_get_view_y(view_camera[1]) + 30);
						}
					}
				}
			}
		} else {
			draw_text(camera_get_view_x(view_camera[2]) + 10, camera_get_view_y(view_camera[2]) + 10, "HIGHSCORE: " + string(camera_highscore_right_view));
			if global.player_one_is_on_right_view {
				var player_one_target = global.camera_view_targets[0];
				if player_one_target != noone {
					if player_one_target.player_type == player_kind.robot_samurai {
						for (var i = 1; i <= player_one_target.player_lives; i++) {
							draw_sprite(spr_player_robot_samurai_life, 0, camera_get_view_x(view_camera[2]) + 10 * i, camera_get_view_y(view_camera[2]) + 30);
						}
					} else if player_one_target.player_type == player_kind.panda {
						for (var i = 1; i <= player_one_target.player_lives; i++) {
							draw_sprite(spr_player_panda_life, 0, camera_get_view_x(view_camera[2]) + 10 * i, camera_get_view_y(view_camera[2]) + 30);
						}
					}
				}
			}
			if global.player_two_is_on_right_view {
				var player_two_target = global.camera_view_targets[1];
				if player_two_target != noone {
					if player_two_target.player_type == player_kind.robot_samurai {
						for (var i = 1; i <= player_two_target.player_lives; i++) {
							draw_sprite(spr_player_robot_samurai_life, 0, camera_get_view_x(view_camera[2]) + 10 * i, camera_get_view_y(view_camera[2]) + 30);
						}
					} else if player_two_target.player_type == player_kind.panda {
						for (var i = 1; i <= player_two_target.player_lives; i++) {
							draw_sprite(spr_player_panda_life, 0, camera_get_view_x(view_camera[2]) + 10 * i, camera_get_view_y(view_camera[2]) + 30);
						}
					}
				}
			}
		}
	}
}