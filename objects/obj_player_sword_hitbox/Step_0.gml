/// @description Handle sword hitbox update

// Handle sword hitbox collision on enemies
if place_meeting(x, y, obj_enemy_controller) {
	var enemy_list = ds_list_create();
	var number_of_enemies = instance_place_list(x, y, obj_enemy_controller, enemy_list, false);

	if number_of_enemies > 0 {
		for (var i = 0; i < number_of_enemies; i++) {
			// Handle enemy death
			var current_enemy = enemy_list[| i]; // Get current enemy being hit by sword
			
			if current_enemy.enemy_current_state != enemy_states.death and current_enemy.enemy_current_state != enemy_states.spawn { // Only handle enemy death if it's not already dead
				// Set enemy to death state
				current_enemy.enemy_last_state = current_enemy.enemy_current_state;
				current_enemy.enemy_current_state = enemy_states.death;
			
				// Set enemy death horizontal and vertical speed
				current_enemy.enemy_horizontal_speed = sign(sword_hitbox_owner.player_animation.image_xscale);
				current_enemy.enemy_vertical_speed = -1;
			
				// Set enemy animation image xscale
				current_enemy.enemy_animation.image_xscale = -sign(sword_hitbox_owner.player_animation.image_xscale);
				
				// Update player highscore based on player one target
				var player_one_target = global.camera_view_targets[0];
				// Enemy score logic based on enemy kind
				var enemy_score = 50;
				switch current_enemy.enemy_type {
					case enemy_kind.ufo_striker:
						enemy_score = 25;
						break;
					case enemy_kind.ufo_shooter:
						enemy_score = 50;
						break;
					case enemy_kind.ufo_hybrid:
						enemy_score = 100;
						break;
				}
				if player_one_target == sword_hitbox_owner.id {
					global.highscore_player_one += enemy_score;
				} else {
					global.highscore_player_two += enemy_score;
				}
			}
		}
	}

	ds_list_destroy(enemy_list);
}

// Handle sword hitbox on laser shot
if place_meeting(x, y, obj_enemy_laser) {
	var laser_shot_list = ds_list_create();
	var number_of_laser_shots = instance_place_list(x, y, obj_enemy_laser, laser_shot_list, false);
	
	if number_of_laser_shots > 0 {
		for (var i = 0; i < number_of_laser_shots; i++) {
			// Handle laser shot deletion
			var current_laser = laser_shot_list[| i]; // Get current laser being hit by sword
			
			// Delete current laser being hit by sword
			instance_destroy(current_laser);
		}
	}
}