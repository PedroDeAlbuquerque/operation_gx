/// @description Handle the gothic girl npc object update

// Handle npc behavior based on current state
switch npc_current_state {
	case npc_states.idle:
		npc_horizontal_speed = 0;
		npc_vertical_speed = 0;
		if !alarm[0] {
			alarm[0] = irandom_range(60, 180)
		}
		break;
	case npc_states.sprint:
		npc_horizontal_speed = npc_base_speed * npc_horizontal_direction;
		npc_vertical_speed = npc_base_speed * npc_vertical_direction;
		if !alarm[0] {
			alarm[0] = irandom_range(60, 180)
		}
		break;
}

// Handle npc collision and movement based on current speed
repeat(abs(npc_horizontal_speed)) {
	if place_meeting(x + sign(npc_horizontal_speed), y, obj_scenery_wall) {
		npc_horizontal_speed = 0;
		npc_horizontal_direction *= -1;
		break;
	} else {
		x += sign(npc_horizontal_speed);
	}
}
repeat(abs(npc_vertical_speed)) {
	if place_meeting(x, y + sign(npc_vertical_speed), obj_scenery_wall) {
		npc_vertical_speed = 0;
		npc_vertical_direction *= -1;
		break;
	} else {
		y += sign(npc_vertical_speed);
	}
}