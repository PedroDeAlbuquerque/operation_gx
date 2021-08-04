/// @description Handle strike hitbox update

var hitbox_can_give_damage = true;

// Handle hybrid enemy hitbox variables
if strike_hitbox_owner != -1 and instance_exists(strike_hitbox_owner) {
	if strike_hitbox_owner.enemy_type == enemy_kind.ufo_hybrid {
		strike_hitbox_final_x_scale = .5;
		strike_hitbox_horizontal_offset = 10;
		strike_hitbox_vertical_offset = 19;
		
		if not strike_hitbox_hybrid_is_ready {
			hitbox_can_give_damage = false;
		}
	}
}


// Handle strike hitbox collision on enemies
if hitbox_can_give_damage {
	if place_meeting(x, y, obj_player_controller) {
		var player_list = ds_list_create();
		var number_of_players = instance_place_list(x, y, obj_player_controller, player_list, false);

		if number_of_players > 0 {
			for (var i = 0; i < number_of_players; i++) {
				// Handle player death
				var current_player = player_list[| i]; // Get current player being hit by strike
			
				if current_player.player_current_state != player_states.death and current_player.player_current_state != player_states.spawn { // Only handle player death if it's not already dead
					// Set player to death state
					current_player.player_last_state = current_player.player_current_state;
					current_player.player_current_state = player_states.death;
			
					// Set enemy death horizontal and vertical speed
					current_player.player_horizontal_speed = sign(strike_hitbox_owner.enemy_animation.image_xscale);
					current_player.player_vertical_speed = -1;
			
					// Set enemy animation image xscale
					current_player.player_animation.image_xscale = -sign(strike_hitbox_owner.enemy_animation.image_xscale);
				}
			}
		}

		ds_list_destroy(player_list);
	}
}