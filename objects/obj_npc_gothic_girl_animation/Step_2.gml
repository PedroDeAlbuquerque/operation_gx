/// @description Handle the gothic girl npc animation update end

// Only handle npc animation if it's owner does exists
if npc_animation_owner != -1 and instance_exists(npc_animation_owner) {
	// Handle image facing based on animation owner horizontal speed
	if npc_animation_owner.npc_horizontal_speed != 0 {
		if sign(npc_animation_owner.npc_horizontal_speed) != sign(image_xscale) {
			image_xscale *= -1;
		}
	}
	
	// Handle player animation based on player current state and type/kind
	switch npc_animation_owner.npc_current_state {
		case npc_states.idle:
			sprite_index = spr_npc_gothic_girl_idle;
			break;
		case npc_states.sprint:
			sprite_index = spr_npc_gothic_girl_sprint;
			break;
	}
	
	// Update npc animation current sprite
	npc_animation_current_sprite = sprite_index;
	// Reset sprite animation if npc animation last frame sprite is not the same as the current sprite
	if npc_animation_last_sprite != npc_animation_current_sprite {
		image_index = 0;
		npc_animation_last_sprite = npc_animation_current_sprite;
	}
	
	// Update npc animation positioning based on npc position
	x = npc_animation_owner.x;
	y = npc_animation_owner.y;
}