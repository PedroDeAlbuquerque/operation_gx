/// @description Handle strike hitbox update end

if strike_hitbox_owner != -1 and instance_exists(strike_hitbox_owner) {
	// Set image x scale based on owner animation x scale
	image_xscale = sign(strike_hitbox_owner.enemy_animation.image_xscale) * strike_hitbox_final_x_scale;
	
	// Update position based on owner position and it's horizontal offset
	x = strike_hitbox_owner.x + (sign(image_xscale) * strike_hitbox_horizontal_offset);
	y = strike_hitbox_owner.y + strike_hitbox_vertical_offset;
	
	if strike_hitbox_owner.enemy_type == enemy_kind.ufo_hybrid {
		if abs(image_xscale) == .5 {
			strike_hitbox_hybrid_is_ready = true;
		}
	}
	
	with strike_hitbox_owner { // Delete sword hitbox if player is not on attack state
		if enemy_current_state != player_states.attack {
			instance_destroy(enemy_strike_hitbox);
			enemy_strike_hitbox = -1;
		}
	}
}