/// @description Handle the enemy laser update

// Handle bullet movement
if laser_horizontal_direction != 0 {
	x += 4 * laser_horizontal_direction;
}

// Handle laser collision on enemies
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
				current_player.player_horizontal_speed = laser_horizontal_direction;
				current_player.player_vertical_speed = -1;
			
				// Set enemy animation image xscale
				current_player.player_animation.image_xscale = -laser_horizontal_direction;
			}
		}
	}

	ds_list_destroy(player_list);
	
	// Destroy itself upon player hit
	instance_destroy();
}

// Delete laser if it's outside room
if (x < 0 or x > room_width) or (y < 0 or y > room_height) {
	instance_destroy();
}