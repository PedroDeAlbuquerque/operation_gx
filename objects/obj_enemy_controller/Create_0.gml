/// @description Initialize the enemy object

// Variable to store the enemy type
enemy_type = enemy_kind.ufo_striker;

// Variables related to the current enemy state
enemy_current_state = enemy_states.idle;
enemy_last_state = enemy_current_state;

// Movement related variables
enemy_horizontal_speed = 0;
enemy_vertical_speed = 0;
enemy_base_speed = 2;
// Variables related to enemy strike
enemy_strike_hitbox = -1;

// Variable to handle which player the enemy is targeting
enemy_target_player = -1;
enemy_target_player_max_delay = 15;
enemy_target_player_delay = enemy_target_player_max_delay; 

// Variables related to player animation
enemy_animation = instance_create_layer(x, y, "Animation_Bottom_Layer", obj_enemy_animation);
enemy_animation.enemy_animation_owner = id;

// Set image alpha
image_alpha = 0;