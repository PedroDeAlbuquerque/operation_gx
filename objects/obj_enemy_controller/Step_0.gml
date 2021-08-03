/// @description Handle the enemy object update

// Handle enemy action based on current enemy state and behavior
switch enemy_current_state {
	case enemy_states.idle:
		if enemy_horizontal_speed != 0 or enemy_vertical_speed != 0 {
			enemy_last_state = enemy_current_state;
			enemy_current_state = enemy_states.sprint;
		}
		break;
	case enemy_states.sprint:
		if enemy_horizontal_speed == 0 and enemy_vertical_speed == 0 {
			enemy_last_state = enemy_current_state;
			enemy_current_state = enemy_states.idle;
		}
		break;
	case enemy_states.attack:
		enemy_horizontal_speed = 0;
		enemy_vertical_speed = 0;
		break;
	case enemy_states.death:
		break;
}

// Get enemy player target and trigger enemy aggressiveness based on enemy type
var distance_to_trigger_aggressiveness = 150;
switch enemy_type {
	case enemy_kind.ufo_striker:
		distance_to_trigger_aggressiveness = 150;
		break;
	case enemy_kind.ufo_shooter:
		distance_to_trigger_aggressiveness = 200;
		break;
	case enemy_kind.ufo_hybrid:
		distance_to_trigger_aggressiveness = 175;
		break;
}
scr_enemy_aggressiveness_trigger(distance_to_trigger_aggressiveness);

// Handle enemy movement, attack and collision based on horizontal and vertical speed and enemy type
if enemy_current_state != enemy_states.death {
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
			break;
		case enemy_kind.ufo_hybrid:
			break;
	}
}

repeat(abs(enemy_horizontal_speed)) {
	x += sign(enemy_horizontal_speed);
}
repeat(abs(enemy_vertical_speed)) {
	y += sign(enemy_vertical_speed);
}