/// @description Initialize game

// Resolution related globals
global.resolution_width = 480;
global.resolution_height = 270;

// Gamepad related globals
global.gamepad_one_identifier = noone;
global.gamepad_two_identifier = noone;

// Camera related globals
global.camera_view_targets = array_create(2, noone);
global.camera_full_view_bounds = array_create(4);

room_goto_next();