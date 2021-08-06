/// @description Handle the enemy object update

// Handle the collision box size based on enemy kind
switch enemy_type {
	case enemy_kind.ufo_striker:
		image_xscale = 1;
		image_yscale = 1;
		break;
	case enemy_kind.ufo_shooter:
		image_xscale = .5;
		image_yscale = .5;
		break;
	case enemy_kind.ufo_hybrid:
		image_xscale = 1.2;
		image_yscale = 1.2;
		break;
}

// Handle enemy action based on current enemy state and behavior
switch enemy_current_state {
	case enemy_states.spawn:
		enemy_spawn_timer--;
		if enemy_spawn_timer <= 0 {
			enemy_current_state = enemy_states.idle;
			enemy_last_state = enemy_current_state;
		}
		break;
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
if enemy_current_state != enemy_states.death and enemy_current_state != enemy_states.spawn {
	scr_enemy_action_controller(distance_to_trigger_aggressiveness);
}

repeat(abs(enemy_horizontal_speed)) {
	if place_meeting(x + sign(enemy_horizontal_speed), y, obj_scenery_wall) {
		enemy_horizontal_speed = 0;
		break;
	} else {
		x += sign(enemy_horizontal_speed);
	}
}
repeat(abs(enemy_vertical_speed)) {
	if place_meeting(x, y + sign(enemy_vertical_speed), obj_scenery_wall) {
		enemy_vertical_speed = 0;
		break;
	} else {
		y += sign(enemy_vertical_speed);
	}
}