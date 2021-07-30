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
	
	buttons_samurai_left_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padl) or left_axis_is_pressed;
	buttons_samurai_right_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padr) or right_axis_is_pressed;
	buttons_samurai_up_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padu) or up_axis_is_pressed;
	buttons_samurai_down_key_input = gamepad_button_check(global.gamepad_one_identifier, gp_padd) or down_axis_is_pressed;
} else { // Check keyboard input
	buttons_samurai_left_key_input = keyboard_check(ord("A"));
	buttons_samurai_right_key_input = keyboard_check(ord("D"));
	buttons_samurai_up_key_input = keyboard_check(ord("W"));
	buttons_samurai_down_key_input = keyboard_check(ord("S"));
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
	
	buttons_ninja_left_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padl) or left_axis_is_pressed;
	buttons_ninja_right_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padr) or right_axis_is_pressed;
	buttons_ninja_up_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padu) or up_axis_is_pressed;
	buttons_ninja_down_key_input = gamepad_button_check(global.gamepad_two_identifier, gp_padd) or down_axis_is_pressed;
} else { // Check keyboard input
	buttons_ninja_left_key_input = keyboard_check(vk_left);
	buttons_ninja_right_key_input = keyboard_check(vk_right);
	buttons_ninja_up_key_input = keyboard_check(vk_up);
	buttons_ninja_down_key_input = keyboard_check(vk_down);
}