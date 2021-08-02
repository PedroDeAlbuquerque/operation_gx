/// @description Handle the game buttons controller update

// Handle both players gamepad connection and disconnection
var gamepad_device_number = gamepad_get_device_count();
for(var i = 0; i < gamepad_device_number; i++) {
	if gamepad_is_connected(i) {
		if global.gamepad_one_identifier == noone {
			if global.gamepad_two_identifier == noone or (global.gamepad_two_identifier != noone and global.gamepad_two_identifier != i) {
				global.gamepad_one_identifier = i;
			}
		}
		if global.gamepad_two_identifier == noone {
			if (global.gamepad_one_identifier != noone and global.gamepad_one_identifier != i) {
				global.gamepad_two_identifier = i;
			}
		}
	}
	if not gamepad_is_connected(i) {
		if global.gamepad_one_identifier == i {
			global.gamepad_one_identifier = noone;
		}
		if global.gamepad_two_identifier == i {
			global.gamepad_two_identifier = noone;
		}
	}
}

// Check for player input based on gamepad connection
// Samurai player input
if global.gamepad_one_identifier != noone { // Check gamepad input
	// Handle gamepad axis logic to check movement by the gamepad axis or pad
	var horizontal_axis_value = round(gamepad_axis_value(global.gamepad_one_identifier, gp_axislh));
	var vertical_axis_value = round(gamepad_axis_value(global.gamepad_one_identifier, gp_axislv));
	var left_axis_is_pressed = false;
	if horizontal_axis_value == -1 {
		left_axis_is_pressed = true;
	}
	var right_axis_is_pressed = false;
	if horizontal_axis_value == 1 {
		right_axis_is_pressed = true;
	}
	var up_axis_is_pressed = false;
	if vertical_axis_value == -1 {
		up_axis_is_pressed = true;
	}
	var down_axis_is_pressed = false;
	if vertical_axis_value == 1 {
		down_axis_is_pressed = true;
	}
	// Direction input
	buttons_leftgroup_left_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padl) or left_axis_is_pressed;
	buttons_leftgroup_right_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padr) or right_axis_is_pressed;
	buttons_leftgroup_up_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padu) or up_axis_is_pressed;
	buttons_leftgroup_down_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padd) or down_axis_is_pressed;
	
	// Action input
	buttons_leftgroup_attack_key_input = gamepad_button_check_pressed(global.gamepad_one_identifier, gp_face2);
	buttons_leftgroup_dashtalk_key_input = gamepad_button_check_pressed(global.gamepad_one_identifier, gp_face1);
} else { // Check keyboard input
	// Direction input
	buttons_leftgroup_left_key_input = keyboard_check(ord("A"));
	buttons_leftgroup_right_key_input = keyboard_check(ord("D"));
	buttons_leftgroup_up_key_input = keyboard_check(ord("W"));
	buttons_leftgroup_down_key_input = keyboard_check(ord("S"));
	
	// Action input
	buttons_leftgroup_attack_key_input = keyboard_check_pressed(ord("G"));
	buttons_leftgroup_dashtalk_key_input = keyboard_check_pressed(ord("H"));
}
// Ninja player
if global.gamepad_two_identifier != noone { // Check gamepad input
	// Handle gamepad axis logic to check movement by the gamepad axis or pad
	var horizontal_axis_value = round(gamepad_axis_value(global.gamepad_two_identifier, gp_axislh));
	var vertical_axis_value = round(gamepad_axis_value(global.gamepad_two_identifier, gp_axislv));
	var left_axis_is_pressed = false;
	if horizontal_axis_value == -1 {
		left_axis_is_pressed = true;
	}
	var right_axis_is_pressed = false;
	if horizontal_axis_value == 1 {
		right_axis_is_pressed = true;
	}
	var up_axis_is_pressed = false;
	if vertical_axis_value == -1 {
		up_axis_is_pressed = true;
	}
	var down_axis_is_pressed = false;
	if vertical_axis_value == 1 {
		down_axis_is_pressed = true;
	}
	// Direction input
	buttons_rightgroup_left_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padl) or left_axis_is_pressed;
	buttons_rightgroup_right_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padr) or right_axis_is_pressed;
	buttons_rightgroup_up_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padu) or up_axis_is_pressed;
	buttons_rightgroup_down_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padd) or down_axis_is_pressed;
	
	// Action input
	buttons_rightgroup_attack_key_input = gamepad_button_check_pressed(global.gamepad_two_identifier, gp_face2);
	buttons_rightgroup_dashtalk_key_input = gamepad_button_check_pressed(global.gamepad_two_identifier, gp_face1);
} else { // Check keyboard input
	// Direction input
	buttons_rightgroup_left_key_input = keyboard_check(vk_left);
	buttons_rightgroup_right_key_input = keyboard_check(vk_right);
	buttons_rightgroup_up_key_input = keyboard_check(vk_up);
	buttons_rightgroup_down_key_input = keyboard_check(vk_down);
	
	// Action input
	buttons_rightgroup_attack_key_input = keyboard_check_pressed(98);
	buttons_rightgroup_dashtalk_key_input = keyboard_check_pressed(99);
}