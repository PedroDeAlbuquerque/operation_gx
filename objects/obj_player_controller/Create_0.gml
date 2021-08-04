/// @description Initialize the player object

// Variable to handle the player lives and respawn point
player_lives = 3;
player_respawn_x = x;
player_respawn_y = y;
player_respawn_max_timer = 60;
player_respawn_timer = player_respawn_max_timer;

// Variable to store the player gamepad type
player_buttons_identifier = -1;

// Variable to store the player type
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
// Sword attack related variables
player_sword_hitbox = -1;
player_sword_combo_max_timer = 15;
player_sword_combo_timer = player_sword_combo_max_timer;
player_sword_combo_is_being_executed = false;
// Bullet shot related variables
player_bullet_shot_is_executed = false;

// Variables related to player animation
player_animation = instance_create_layer(x, y, "Animation_Layer", obj_player_animation);
player_animation.player_animation_owner = id;

// Set image alpha
image_alpha = 0;