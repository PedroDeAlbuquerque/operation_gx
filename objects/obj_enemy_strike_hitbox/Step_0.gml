/// @description Handle strike hitbox update

// Handle strike hitbox collision on enemies
if place_meeting(x, y, obj_player_controller) {
	var player_list = ds_list_create();
	var number_of_players = instance_place_list(x, y, obj_player_controller, player_list, false);

	if number_of_players > 0 {
		for (var i = 0; i < number_of_players; i++) {
			// Handle player death
			var current_player = player_list[| i]; // Get current player being hit by strike
			
			if current_player.player_current_state != player_states.death { // Only handle player death if it's not already dead
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