/// @description Handle the camera controller update

// Calculate camera player bounds
scr_game_camera_calculate_player_bounds();

if view_visible[0] == true {
	scr_game_camera_full_view_update();
} else {
	if not camera_split_views_are_combining {
		scr_game_camera_split_view_update();
	}
}

// Toggle between camera full and split view based on camera player bounds
var border_size = 57;
if camera_split_views_are_combining {
	// Update full view camera position for better feeling and correct positioning
	scr_game_camera_full_view_update(camera_full_view);
	
	// Get cameras x and y position
	var camera_full_view_x = camera_get_view_x(camera_full_view);
	var camera_full_view_y = camera_get_view_y(camera_full_view);
	
	var camera_left_view_x = camera_get_view_x(camera_left_view);
	var camera_left_view_y = camera_get_view_y(camera_left_view);
	
	var camera_right_view_x = camera_get_view_x(camera_right_view);
	var camera_right_view_y = camera_get_view_y(camera_right_view);
	
	// Move camera gradually to combine both views
	var camera_lerp_rate = .2;
	var timer = 45;
	var camera_lerp_rate = lerp(.2, 1, sqr(camera_split_views_combining_timer/timer));
	camera_left_view_x = lerp(camera_left_view_x, camera_full_view_x, camera_lerp_rate);
	var camera_right_view_target_x = camera_full_view_x + camera_get_view_width(camera_full_view) - camera_get_view_width(camera_right_view);
	camera_right_view_x = lerp(camera_right_view_x, camera_right_view_target_x, camera_lerp_rate);
	camera_left_view_y = lerp(camera_left_view_y, camera_full_view_y, camera_lerp_rate);
	camera_right_view_y = lerp(camera_right_view_y, camera_full_view_y, camera_lerp_rate);
	
	// Set split cameras position
	camera_set_view_pos(camera_left_view, camera_left_view_x, camera_left_view_y);
	camera_set_view_pos(camera_right_view, camera_right_view_x, camera_right_view_y);
	
	// Decrease screen filter distortion to achieve better feeling when combining views 
	obj_game_screen_filter.screen_distortion_ammount = lerp(obj_game_screen_filter.screen_distortion_ammount, .075, .05);
	
	// Split camera if players diverge
	if (
		(global.camera_full_view_bounds[2] - global.camera_full_view_bounds[0]) > (camera_get_view_width(camera_full_view) - camera_split_view_border * border_size) or 
		(global.camera_full_view_bounds[3] - global.camera_full_view_bounds[1]) > (camera_get_view_height(camera_full_view) - camera_split_view_border * border_size)
		) {
			camera_split_views_are_combining = false;
			camera_split_views_combining_timer = 0;
			obj_game_screen_filter.screen_distortion_ammount = .15; // Normalize screen filter distortion
		}
	
	// Check split cameras position before combining them
	var threshold = .25;
	var camera_left_view_combining_target = (sqr(camera_left_view_x - camera_full_view_x) + sqr(camera_left_view_y - camera_full_view_y)) < threshold;
	var camera_right_view_combining_target = (sqr(camera_right_view_x - camera_right_view_target_x) + sqr(camera_right_view_y - camera_full_view_y)) < threshold;
	if (camera_split_views_combining_timer > timer) or (camera_left_view_combining_target and camera_right_view_combining_target) {
		// Combine cameras
		view_visible[0] = true;
		view_visible[1] = false;
		view_visible[2] = false;
	
		// Set that cameras are not combining anymore
		camera_split_views_are_combining = false;
		obj_game_screen_filter.screen_distortion_ammount = .15; // Normalize screen filter distortion
	}
	
	camera_split_views_combining_timer++;
} else {
	if (
		(global.camera_full_view_bounds[2] - global.camera_full_view_bounds[0]) > (camera_get_view_width(camera_full_view) - camera_split_view_border * border_size) or 
		(global.camera_full_view_bounds[3] - global.camera_full_view_bounds[1]) > (camera_get_view_height(camera_full_view) - camera_split_view_border * border_size)
		) {
		if view_visible[0] {
			view_visible[0] = false;
			view_visible[1] = true;
			view_visible[2] = true;
			
			var camera_full_view_x = camera_get_view_x(camera_full_view);
			var camera_full_view_y = camera_get_view_y(camera_full_view);
		
			camera_set_view_pos(camera_left_view, camera_full_view_x, camera_full_view_y);
			camera_set_view_pos(camera_right_view, camera_full_view_x + camera_get_view_width(camera_full_view) - camera_get_view_width(camera_right_view), camera_full_view_y);
		}
	} else {
		if !view_visible[0] {
			scr_game_camera_full_view_update(camera_full_view, 1);
			
			camera_split_views_are_combining = true;
			camera_split_views_combining_timer = 0;
		}
	}
}