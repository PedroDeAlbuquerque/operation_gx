/// @description Handle the split view game camera update
function scr_game_camera_split_view_update(){
	// Get player targets
	var player_one_target = global.camera_view_targets[0];
	var player_two_target = global.camera_view_targets[1];
	var left_view_target, right_view_target;
	if player_one_target.x < player_two_target.x {
		left_view_target = player_one_target;
		right_view_target = player_two_target;
	} else {
		left_view_target = player_two_target;
		right_view_target = player_one_target;
	}
	
	if left_view_target != noone and instance_exists(left_view_target) { // Only handle left camera view if player one exists
		var current_camera = view_camera[1]; // Store player one current camera
		
		// Set camera positioning based on player
		var camera_x = left_view_target.x - camera_get_view_width(current_camera) * .5;
		var camera_y = left_view_target.y - camera_get_view_height(current_camera) * .5;
		
		// Move camera gradually towards player
		var camera_lerp_rate = .2;
		camera_x = lerp(camera_get_view_x(current_camera), camera_x, camera_lerp_rate);
		camera_y = lerp(camera_get_view_y(current_camera), camera_y, camera_lerp_rate);
		
		// Limit camera x and y position based on room width and height
		camera_x = clamp(camera_x, 0, room_width - global.resolution_width);
		camera_y = clamp(camera_y, 0, room_height - global.resolution_height);
		
		// Set camera position
		camera_set_view_pos(current_camera, camera_x, camera_y);
	}
	if right_view_target != noone and instance_exists(right_view_target) { // Only handle left camera view if player two exists
		var current_camera = view_camera[2]; // Store player two current camera
		
		// Set camera positioning based on player
		var camera_x = right_view_target.x - camera_get_view_width(current_camera) * .5;
		var camera_y = right_view_target.y - camera_get_view_height(current_camera) * .5;
		
		// Move camera gradually towards player
		var camera_lerp_rate = .2;
		camera_x = lerp(camera_get_view_x(current_camera), camera_x, camera_lerp_rate);
		camera_y = lerp(camera_get_view_y(current_camera), camera_y, camera_lerp_rate);
		
		// Limit camera x and y position based on room width and height
		camera_x = clamp(camera_x, 0, room_width - global.resolution_width);
		camera_y = clamp(camera_y, 0, room_height - global.resolution_height);
		
		// Set camera position
		camera_set_view_pos(current_camera, camera_x, camera_y);
	}
}