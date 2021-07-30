/// @description Handle player animation update

// Handle player animation based on player current state and type/kind
if player_animation_owner != -1 and instance_exists(player_animation_owner) {
	switch player_animation_owner.player_type {
		case player_kind.samurai:
			sprite_index = spr_player_samurai_idle;
			break;
		case player_kind.ninja:
			sprite_index = spr_player_ninja_idle;
			break;
	}
	
	switch player_animation_owner.player_current_state {
		case player_states.idle:
			break;
		case player_states.sprint:
			break;
		case player_states.sprint_end:
			break;
		case player_states.attack:
			break;
		case player_states.dash:
			break;
		case player_states.talk:
			break;
		case player_states.death:
			break;
	}
}