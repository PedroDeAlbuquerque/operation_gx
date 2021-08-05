/// @description Create screen filter variables and get it's uniforms

// Variable to check if screen filter is on
screen_filter_is_on = true;

// Set shader to use
screen_shader_to_use = sh_screen_filter;

screen_surface_split_view_left = -1;
screen_surface_split_view_right = -1;

// Get shader uniforms
screen_uniform_distortion = shader_get_uniform(screen_shader_to_use, "u_distortion");
screen_uniform_screen_flash = shader_get_uniform(screen_shader_to_use, "u_screen_flash");
screen_uniform_chromatic_aberration = shader_get_uniform(screen_shader_to_use, "u_chromatic_aberration");

// Set screen distortion to achieve screen effect
screen_distortion_ammount = .15;