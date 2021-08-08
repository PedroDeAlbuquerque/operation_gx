/// @description Draw dialog box with it's text

if dialog_box_text != -1 {
	draw_self();
	
	draw_set_font(fnt_dialog_text);
	var dialog_height = string_height(dialog_box_text);
	dialog_part_text = string_copy(dialog_box_text, 1, dialog_part_text_count);
	if !alarm[0] {
		alarm[0] = 2;
	}
	draw_text_ext(x + 5, y + 5, dialog_part_text, dialog_height, sprite_width - 5);
}