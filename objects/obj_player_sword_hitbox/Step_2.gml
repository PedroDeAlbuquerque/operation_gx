/// @description Handle sword hitbox update end

if sword_hitbox_owner != -1 and instance_exists(sword_hitbox_owner) {
	// Set image x scale based on owner animation x scale
	image_xscale = sign(sword_hitbox_owner.player_animation.image_xscale);
	
	// Update position based on owner position and it's horizontal offset
	x = sword_hitbox_owner.x + (sign(image_xscale) * sword_hitbox_horizontal_offset);
	y = sword_hitbox_owner.y;
	
	with sword_hitbox_owner { // Delete sword hitbox if player is not on attack state
		if player_current_state != player_states.attack {
			instance_destroy(player_sword_hitbox);
			player_sword_hitbox = -1;
		}
	}
}