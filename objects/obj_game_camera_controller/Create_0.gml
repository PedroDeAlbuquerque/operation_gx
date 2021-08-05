/// @description Initialize the game camera controller object

// Set view variables
view_enabled = true;
view_visible[0] = true;
view_visible[1] = false;
view_visible[2] = false;

// Set view full width and height
var full_view_width = global.resolution_width;
var full_view_height = global.resolution_height;

// Set split view border
camera_split_view_border = 2;

// Set the full viewport
view_set_xport(0, 0);
view_set_yport(0, 0);
view_set_wport(0, full_view_width);
view_set_hport(0, full_view_height);

// Set the split viewport
var split_view_width = (full_view_width - camera_split_view_border) * .5;
var split_view_x_offset = (full_view_width + camera_split_view_border) * .5;
// Set the split left view
view_set_xport(1, 0);
view_set_yport(1, 0);
view_set_wport(1, split_view_width);
view_set_hport(1, full_view_height);

// Set the split right view
view_set_xport(2, split_view_x_offset);
view_set_yport(2, 0);
view_set_wport(2, split_view_width);
view_set_hport(2, full_view_height);

// Create cameras and set them on it's view with it's update script
// Full view camera
camera_full_view = camera_create_view(0, 0, full_view_width, full_view_height);
view_set_camera(0, camera_full_view);
// Left view camera
camera_left_view = camera_create_view(0, 0, split_view_width, full_view_height);
view_set_camera(1, camera_left_view);
// Right view camera
camera_right_view = camera_create_view(0, 0, split_view_width, full_view_height);
view_set_camera(2, camera_right_view);

// Variable to check if camera split view is combining
camera_split_views_are_combining = false;
camera_split_views_combining_timer = 0;

// Highscore variables based on views
camera_highscore_left_view = global.highscore_player_one;
camera_highscore_right_view = global.highscore_player_two;