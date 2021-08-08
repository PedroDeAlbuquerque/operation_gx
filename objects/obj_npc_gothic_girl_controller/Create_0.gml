/// @description Initialize the gothic girl npc object

// Variables related to the player states
npc_current_state = npc_states.idle;
npc_last_state = npc_current_state;

// Movement related variables
npc_horizontal_direction = choose(-1, 0, 1);
npc_vertical_direction = choose(-1, 0, 1);
if npc_horizontal_direction == 0 {
	npc_vertical_direction = choose(-1, 1);
}
npc_horizontal_speed = 0;
npc_vertical_speed = 0;
npc_base_speed = 1;

// Variables related to player animation
npc_animation = instance_create_layer(x, y, "Animation_Layer", obj_npc_gothic_girl_animation);
npc_animation.npc_animation_owner = id;

// Set image alpha
image_alpha = 0;