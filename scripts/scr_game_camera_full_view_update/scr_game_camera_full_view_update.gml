/// @description Handle the full view game camera update
function scr_game_camera_full_view_update(){
	var current_camera = view_camera[view_current]; // Set current camera view
	var lerp_rate = .2; // Set lerp rate
	if argument_count > 0 { // Set another camera view and/or lerp rate based on optional arguments
		current_camera = argument[0];
		
		if argument_count > 1 {
			lerp_rate = argument[1];
		}
	}

	// Set camera positioning based on players
	var combined_x = (global.camera_full_view_bounds[0] + global.camera_full_view_bounds[2] - camera_get_view_width(current_camera)) * .5;
	var combined_y = (global.camera_full_view_bounds[1] + global.camera_full_view_bounds[3] - camera_get_view_height(current_camera)) * .5;
	
	// Move camera gradually towards players
	combined_x = lerp(camera_get_view_x(current_camera), combined_x, lerp_rate);
	combined_y = lerp(camera_get_view_y(current_camera), combined_y, lerp_rate);
		
	// Limit camera x and y position based on room width and height
	combined_x = clamp(combined_x, 0, room_width - global.resolution_width);
	combined_y = clamp(combined_y, 0, room_height - global.resolution_height);
		
	camera_set_view_pos(current_camera, combined_x, combined_y);
}