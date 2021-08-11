/// @description Reset game globals for fresh init
function scr_game_reset_globals(){
	// Resolution related globals
	global.resolution_width = 480;
	global.resolution_height = 270;

	// Shader related globals
	global.shader_full_view_flash = 0;
	global.shader_left_view_flash = 0;
	global.shader_right_view_flash = 0;
	global.shader_full_view_chromatic_aberration = 0;
	global.shader_left_view_chromatic_aberration = 0;
	global.shader_right_view_chromatic_aberration = 0;

	// Gamepad related globals
	global.gamepad_one_identifier = noone;
	global.gamepad_two_identifier = noone;
	global.gamepad_one_buttons_group = buttons_identifier.left_group;
	global.gamepad_two_buttons_group = buttons_identifier.right_group;

	// Camera related globals
	global.camera_view_targets = array_create(2, noone);
	global.camera_full_view_bounds = array_create(4);
	
	// Player side related globals
	global.player_one_is_on_left_view = false;
	global.player_two_is_on_left_view = false;
	global.player_one_is_on_right_view = false;
	global.player_two_is_on_right_view = false;

	// Highscore related globals
	global.highscore_player_one = 0;
	global.highscore_player_two = 0;
	global.highscore_show_two_players = false;

	// Game over related globals
	global.gameover_on_player_one = false;
	global.gameover_on_player_two = false;
}