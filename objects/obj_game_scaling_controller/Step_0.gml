/// @description Handle the game scaling update

if (browser_width != scaling_width) or (browser_height != scaling_height) {
	scaling_width = min(scaling_base_width, browser_width);
	scaling_height = min(scaling_base_height, browser_height);
	scr_game_scale_canvas(scaling_base_width, scaling_base_height, scaling_width, scaling_height, true);
}