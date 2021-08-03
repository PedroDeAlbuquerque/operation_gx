/// @description Handle enemy animation update end

// Only handle enemy animation if it's owner does exists
if enemy_animation_owner != -1 and instance_exists(enemy_animation_owner) {
	// Handle image facing based on animation owner horizontal speed
	if enemy_animation_owner.enemy_horizontal_speed != 0 and enemy_animation_owner.enemy_current_state != enemy_states.death {
		if sign(enemy_animation_owner.enemy_horizontal_speed) != sign(image_xscale) {
			image_xscale *= -1;
		}
	}
	
	// Handle enemy animation based on enemy current state and type/kind
	switch enemy_animation_owner.enemy_current_state {
		case enemy_states.idle:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_idle;
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_idle;
					break;
				case enemy_kind.ufo_hybrid:
					break;
			}

			break;
		case enemy_states.sprint:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_sprint;
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_sprint;
					break;
				case enemy_kind.ufo_hybrid:
					break;
			}

			break;
		case enemy_states.attack:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_attack;
					
					// Generate strike hitbox if it doesn't exists
					if (floor(image_index) >= sprite_get_number(sprite_index) - 2) and (enemy_animation_current_sprite == enemy_animation_last_sprite) {
						with enemy_animation_owner {
							if enemy_strike_hitbox == -1 {
								enemy_strike_hitbox = instance_create_layer(x + (sign(other.image_xscale) * 22), y, "Collision_Layer", obj_enemy_strike_hitbox);
								enemy_strike_hitbox.strike_hitbox_owner = id;
							}
						}
					}
					
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_attack;
					break;
				case enemy_kind.ufo_hybrid:
					break;
			}
			
			// Normalize enemy state if attack is finished
			if floor(image_index) >= sprite_get_number(sprite_index) - 1 {
				enemy_animation_owner.enemy_current_state = enemy_animation_owner.enemy_last_state;
				enemy_animation_owner.enemy_last_state = enemy_states.attack;
			}
			
			break;
		case enemy_states.death:
			switch enemy_animation_owner.enemy_type {
				case enemy_kind.ufo_striker:
					sprite_index = spr_enemy_ufo_striker_death;
					break;
				case enemy_kind.ufo_shooter:
					sprite_index = spr_enemy_ufo_shooter_death;
					break;
				case enemy_kind.ufo_hybrid:
					break;
			}
			
			// Hold last frame for death feeling
			if floor(image_index) >= sprite_get_number(sprite_index) - 1 {
				// Delete enemy after playing death animation
				instance_destroy(enemy_animation_owner);
			}
			break;
	}
	
	// Update player animation current sprite
	enemy_animation_current_sprite = sprite_index;
	// Reset sprite animation if player animation last frame sprite is not the same as the current sprite
	if enemy_animation_last_sprite != enemy_animation_current_sprite {
		image_index = 0;
		enemy_animation_last_sprite = enemy_animation_current_sprite;
	}
	
	// Update player animation positioning based on player position
	x = enemy_animation_owner.x;
	y = enemy_animation_owner.y;
}