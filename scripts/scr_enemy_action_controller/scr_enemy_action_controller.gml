/// @description Handle enemy action based on aggressiveness
function scr_enemy_action_controller(argument0){
	var distance_to_trigger_aggressiveness = argument0;
	
	if enemy_laser_shot_is_executed {
		enemy_laser_shot_delay--;
		
		if enemy_laser_shot_delay <= 0 {
			enemy_laser_shot_is_executed = false;
			enemy_laser_shot_delay = enemy_laser_shot_max_delay;
		}
	}
	
	switch enemy_type {
		case enemy_kind.ufo_striker:
			if enemy_target_player != -1 {
				if enemy_current_state != enemy_states.attack {
					if (distance_to_object(enemy_target_player) <= 15) and ((y + 15) > enemy_target_player.y) and ((y - 15) < enemy_target_player.y) {
						enemy_last_state = enemy_current_state;
						enemy_current_state = enemy_states.attack;
					} else {
						var target_direction = point_direction(x, y, enemy_target_player.x, enemy_target_player.y);
						enemy_horizontal_speed = lengthdir_x(enemy_base_speed, target_direction);
						enemy_vertical_speed = lengthdir_y(enemy_base_speed, target_direction);
					}
				}
			} else {
				enemy_horizontal_speed = 0;
				enemy_vertical_speed = 0;
			}
			break;
		case enemy_kind.ufo_shooter:
			if enemy_target_player != -1 {
				if enemy_current_state != enemy_states.attack {
					if (distance_to_object(enemy_target_player) <= distance_to_trigger_aggressiveness) and ((y + 15) > enemy_target_player.y) and ((y - 15) < enemy_target_player.y) {
						enemy_last_state = enemy_current_state;
						enemy_current_state = enemy_states.attack;
					} else {
						var shooting_distance = 100;
						if enemy_target_player.x >= x {
							shooting_distance = -shooting_distance;
						}
						var ufo_shooter_speed = enemy_base_speed;
						var target_direction = point_direction(x, y, enemy_target_player.x + shooting_distance, enemy_target_player.y);
						enemy_horizontal_speed = lengthdir_x(ufo_shooter_speed, target_direction);
						enemy_vertical_speed = lengthdir_y(ufo_shooter_speed, target_direction);
						
						// Normalize laser shot if it's not shooting
						enemy_laser_shot_is_executed = false;
					}
				}
			} else {
				enemy_horizontal_speed = 0;
				enemy_vertical_speed = 0;
				
				// Normalize laser shot if it's not shooting
				enemy_laser_shot_is_executed = false;
			}
			break;
		case enemy_kind.ufo_hybrid:
			if !enemy_hybrid_is_shooting {
				if enemy_target_player != -1 {
					if enemy_current_state != enemy_states.attack {
						if (distance_to_object(enemy_target_player) <= 10) and ((y + 10) > enemy_target_player.y) and ((y - 10) < enemy_target_player.y) {
							enemy_last_state = enemy_current_state;
							enemy_current_state = enemy_states.attack;
						} else {
							var target_direction = point_direction(x, y, enemy_target_player.x, enemy_target_player.y);
							enemy_horizontal_speed = lengthdir_x(enemy_base_speed, target_direction);
							enemy_vertical_speed = lengthdir_y(enemy_base_speed, target_direction);
						}
					}
				} else {
					enemy_horizontal_speed = 0;
					enemy_vertical_speed = 0;
				}
			} else {
				if enemy_target_player != -1 {
					if enemy_current_state != enemy_states.attack {
						if (distance_to_object(enemy_target_player) <= distance_to_trigger_aggressiveness) and ((y + 10) > enemy_target_player.y) and ((y - 10) < enemy_target_player.y) {
							enemy_last_state = enemy_current_state;
							enemy_current_state = enemy_states.attack;
						} else {
							var shooting_distance = 100;
							if enemy_target_player.x >= x {
								shooting_distance = -shooting_distance;
							}
							var ufo_shooter_speed = enemy_base_speed + 1;
							var target_direction = point_direction(x, y, enemy_target_player.x + shooting_distance, enemy_target_player.y);
							enemy_horizontal_speed = lengthdir_x(ufo_shooter_speed, target_direction);
							enemy_vertical_speed = lengthdir_y(ufo_shooter_speed, target_direction);
						
							// Normalize laser shot if it's not shooting
							enemy_laser_shot_is_executed = false;
						}
					}
				} else {
					enemy_horizontal_speed = 0;
					enemy_vertical_speed = 0;
				
					// Normalize laser shot if it's not shooting
					enemy_laser_shot_is_executed = false;
				}
			}
			break;
	}
}