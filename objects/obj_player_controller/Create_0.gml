/// @description Initialize the player object

// Variable to store the player tyoe
player_type = -1;

// Variables related to the player states
player_current_state = player_states.idle;
player_last_state = player_current_state;

// Movement related variables
player_horizontal_speed = 0;
player_vertical_speed = 0;
player_base_speed = 4;
// Dash related variables
player_is_dashing = false;
player_max_dash_delay = 30;
player_current_dash_delay = player_max_dash_delay;

// Variables related to player animation
player_animation = instance_create_layer(x, y, "Animation_Layer", obj_player_animation);
player_animation.player_animation_owner = id;

// Set image alpha
image_alpha = 0;