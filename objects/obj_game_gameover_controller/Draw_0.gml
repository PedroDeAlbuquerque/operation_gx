/// @description Handle game over drawing

// Set font
draw_set_font(fnt_dialog_text);
if global.gameover_on_player_one {
	draw_text(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 50, "Player one highscore: " + string(global.highscore_player_one));
}
if global.gameover_on_player_two {
	draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - 230), camera_get_view_y(view_camera[0]) + 50, "Player two highscore: " + string(global.highscore_player_two));
}
draw_text(camera_get_view_x(view_camera[0]) + 160, camera_get_view_y(view_camera[0]) + 200, "Press action to reset");