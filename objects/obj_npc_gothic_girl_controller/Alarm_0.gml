/// @description Handle the npc current state change

switch npc_current_state {
	case npc_states.idle:
		npc_horizontal_direction = choose(-1, 0, 1);
		npc_vertical_direction = choose(-1, 0, 1);
		if npc_horizontal_direction == 0 {
			npc_vertical_direction = choose(-1, 1);
		}
		npc_last_state = npc_current_state;
		npc_current_state = npc_states.sprint;
		break;
	case npc_states.sprint:
		npc_last_state = npc_current_state;
		npc_current_state = npc_states.idle;
		break;
}