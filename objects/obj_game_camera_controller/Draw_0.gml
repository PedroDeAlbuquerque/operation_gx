/// @description Handle the highscore drawing

// Set drawing font
if room == rm_game_test { // Only draw highscore if it's on main game screen
	draw_set_font(fnt_main_text);

	// Handle highscore drawing based on current view and number of players
	if view_visible[0] {
		if view_current == 0 {
			draw_text(camera_get_view_x(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + 10, "Highscore: " + string(camera_highscore_left_view));
			if global.highscore_show_two_players {
				draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 100), camera_get_view_y(view_camera[0]) + 10, "Highscore: " + string(camera_highscore_right_view));
			} else {
				var player_one_target = global.camera_view_targets[0];
				var player_two_play_button_text = "";
				if global.gamepad_two_identifier == noone {
					if player_one_target != noone {
						if player_one_target.player_buttons_identifier == buttons_identifier.left_group {
							player_two_play_button_text = "'3'";
						} else if player_one_target.player_buttons_identifier == buttons_identifier.right_group {
							player_two_play_button_text = "'H'";
						}
					}
				} else {
					player_two_play_button_text = "gamepad 'A'";
				}
				draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 100), camera_get_view_y(view_camera[0]) + 10, "Press " + player_two_play_button_text + " to play");
			}
		}
	} else {
		if view_current == 0 {
			draw_text(camera_get_view_x(view_camera[1]) + 10, camera_get_view_y(view_camera[1]) + 10, "Highscore: " + string(camera_highscore_left_view));
		} else {
			draw_text(camera_get_view_x(view_camera[2]) + 10, camera_get_view_y(view_camera[2]) + 10, "Highscore: " + string(camera_highscore_right_view));
		}
	}
}