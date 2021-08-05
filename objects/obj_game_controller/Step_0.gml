/// @description Handle game controller update

// Handle game over logic
if room == rm_main {
	if (global.gameover_on_player_one and global.camera_view_targets[1] == noone) or (global.gameover_on_player_one and global.gameover_on_player_two) {
		global.shader_full_view_flash -= .05;
	
		if global.shader_full_view_flash <= -1 {
			room_goto(rm_gameover);
		}
	}
}
if room == rm_gameover {
	global.shader_full_view_flash += .05;
	global.shader_full_view_flash = clamp(global.shader_full_view_flash, -1, 0);
}