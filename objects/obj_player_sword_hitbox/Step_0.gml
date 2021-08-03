/// @description Handle sword hitbox update

// Handle sword hitbox collision on enemies
if place_meeting(x, y, obj_enemy_controller) {
	var enemy_list = ds_list_create();
	var number_of_enemies = instance_place_list(x, y, obj_enemy_controller, enemy_list, false);

	if number_of_enemies > 0 {
		for (var i = 0; i < number_of_enemies; i++) {
			// Handle enemy death
			var current_enemy = enemy_list[| i]; // Get current enemy being hit by sword
			
			if current_enemy.enemy_current_state != enemy_states.death { // Only handle enemy death if it's not already dead
				// Set enemy to death state
				current_enemy.enemy_last_state = current_enemy.enemy_current_state;
				current_enemy.enemy_current_state = enemy_states.death;
			
				// Set enemy death horizontal and vertical speed
				current_enemy.enemy_horizontal_speed = sign(sword_hitbox_owner.player_animation.image_xscale);
				current_enemy.enemy_vertical_speed = -1;
			
				// Set enemy animation image xscale
				current_enemy.enemy_animation.image_xscale = -sign(sword_hitbox_owner.player_animation.image_xscale);
			}
		}
	}

	ds_list_destroy(enemy_list);
}