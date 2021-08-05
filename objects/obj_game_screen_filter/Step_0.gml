/// @description Get surface

// Set views surface
screen_surface_split_view_left = surface_create(global.shader_width / 2, global.shader_height);
screen_surface_split_view_right = surface_create(global.shader_width / 2, global.shader_height);
view_surface_id[1] = screen_surface_split_view_left;
view_surface_id[2] = screen_surface_split_view_right;
view_set_surface_id(view_camera[1], view_surface_id[1]);
view_set_surface_id(view_camera[2], view_surface_id[2]);

if keyboard_check_pressed(vk_space) {
	if not screen_filter_is_on {
		screen_filter_is_on = true;
	} else {
		screen_filter_is_on = false;
	}
}