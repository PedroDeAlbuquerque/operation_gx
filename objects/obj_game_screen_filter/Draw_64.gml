/// @description Draw screen

// Draw screen with custom filter
if screen_filter_is_on {
	shader_set(screen_shader_to_use);
		shader_set_uniform_f(screen_uniform_distortion, screen_distortion_ammount / 2);
		shader_set_uniform_f(screen_uniform_screen_flash, global.shader_full_view_flash);
		shader_set_uniform_f(screen_uniform_chromatic_aberration, global.shader_full_view_chromatic_aberration);
		if view_visible[0] {
			draw_surface_part(application_surface, 0, 0, global.shader_width, global.shader_height, 0, 0);
		} else {
			shader_set_uniform_f(screen_uniform_distortion, screen_distortion_ammount);
			shader_set_uniform_f(screen_uniform_chromatic_aberration, global.shader_left_view_chromatic_aberration);
			shader_set_uniform_f(screen_uniform_screen_flash, global.shader_left_view_flash);
			draw_surface_part(view_surface_id[1], 0, 0, global.shader_width, global.shader_height, 0, 0);
			shader_set_uniform_f(screen_uniform_chromatic_aberration, global.shader_right_view_chromatic_aberration);
			shader_set_uniform_f(screen_uniform_screen_flash, global.shader_right_view_flash);
			draw_surface_part(view_surface_id[2], -global.shader_width / 2, 0, global.shader_width, global.shader_height, 0, 0);
		}
	
		// Free surfaces to avoid memory leaks
		if surface_exists(view_surface_id[1]) {
			surface_free(view_surface_id[1]);
		}
		if surface_exists(view_surface_id[2]) {
			surface_free(view_surface_id[2]);
		}
	shader_reset();
} else {
	shader_set(sh_normal);
		if view_visible[0] {
			draw_surface_part(application_surface, 0, 0, global.shader_width, global.shader_height, 0, 0);
		} else {
			var view_border = (global.shader_width / 250);
			draw_surface_part(view_surface_id[1], 0, 0, global.shader_width, global.shader_height, 0, 0);
			draw_surface_part(view_surface_id[2], -(global.shader_width / 2) - view_border, 0, global.shader_width, global.shader_height, 0, 0);
		}
	
		// Free surfaces to avoid memory leaks
		if surface_exists(view_surface_id[1]) {
			surface_free(view_surface_id[1]);
		}
		if surface_exists(view_surface_id[2]) {
			surface_free(view_surface_id[2]);
		}
	shader_reset();
}