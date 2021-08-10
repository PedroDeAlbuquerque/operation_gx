/// @description Handle intro game controller object update

if intro_text_phase == 1 {
	if mouse_check_button_pressed(mb_left) {
		intro_text_phase = 2;
	}
}

if intro_text_phase == 3 {
	if !alarm[1] {
		alarm[1] = 60;
	}
}