/// @description Initialize the player object

player_type = -1;

player_current_state = player_states.idle;
player_last_state = player_current_state;

player_horizontal_speed = 0;
player_vertical_speed = 0;

player_animation = instance_create_layer(x, y, "Animation_Layer", obj_player_animation);
player_animation.player_animation_owner = id;