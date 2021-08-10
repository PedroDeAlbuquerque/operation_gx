/// @description Handle the intro text drawing

// Set drawing font
draw_set_font(fnt_dialog_text);

// Draw the first phase text
if intro_text_phase >= 0 {
	var intro_text_one_height = string_height(intro_text_one);
	intro_part_text_one = string_copy(intro_text_one, 1, intro_part_text_one_count);
	if !alarm[0] {
		alarm[0] = 2;
	}
	draw_text_ext(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - 90, camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2) - 40, intro_part_text_one, intro_text_one_height, camera_get_view_width(view_camera[0]));
}

if intro_text_phase == 1 {
	draw_text_ext(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - 65, camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2), intro_text_click, intro_text_one_height, camera_get_view_width(view_camera[0]));
}

if intro_text_phase >= 2 {
	var intro_text_two_height = string_height(intro_text_two);
	intro_part_text_two = string_copy(intro_text_two, 1, intro_part_text_two_count);
	if !alarm[0] {
		alarm[0] = 5;
	}
	draw_text_ext(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - 105, camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2), intro_part_text_two, intro_text_two_height, camera_get_view_width(view_camera[0]));
}