/// @description Handle player animation update end

// Only handle player animation if it's owner does exists
if player_animation_owner != -1 and instance_exists(player_animation_owner) {
	// Handle image facing based on animation owner horizontal speed
	if player_animation_owner.player_horizontal_speed != 0 {
		if sign(player_animation_owner.player_horizontal_speed) != sign(image_xscale) {
			image_xscale *= -1;
		}
	}
	
	// Handle player animation based on player current state and type/kind
	switch player_animation_owner.player_current_state {
		case player_states.idle:
			switch player_animation_owner.player_type {
				case player_kind.samurai:
					sprite_index = spr_player_samurai_idle;
					break;
				case player_kind.ninja:
					sprite_index = spr_player_ninja_idle;
					break;
			}
			break;
		case player_states.sprint:
			switch player_animation_owner.player_type {
				case player_kind.samurai:
					if not player_animation_owner.player_is_dashing {
						sprite_index = spr_player_samurai_sprint;
					} else {
						sprite_index = spr_player_samurai_dash;
					}
					break;
				case player_kind.ninja:
					if not player_animation_owner.player_is_dashing {
						sprite_index = spr_player_ninja_sprint;
					} else {
						sprite_index = spr_player_ninja_dash;
					}
					break;
			}
			break;
		case player_states.attack:
			break;
		case player_states.talk:
			break;
		case player_states.death:
			break;
	}
	
	// Update player animation current sprite
	player_animation_current_sprite = sprite_index;
	// Reset sprite animation if player animation last frame sprite is not the same as the current sprite
	if player_animation_last_sprite != player_animation_current_sprite {
		image_index = 0;
		player_animation_last_sprite = player_animation_current_sprite;
	}
	
	// Update player animation positioning based on player position
	x = player_animation_owner.x;
	y = player_animation_owner.y;
}