/// @description Handle the enemy aggressiveness trigger
/// @param distance Minimum distance to trigger the enemy aggressiveness
function scr_enemy_aggressiveness_trigger(argument0){
	var possible_player_target = instance_nearest(x, y, obj_player_controller);
	var min_distance_to_trigger_aggressiveness = argument0;
	if possible_player_target != noone {
		// Check if possible target is within range and is alive to set it as target
		if (distance_to_object(possible_player_target) <= min_distance_to_trigger_aggressiveness) and (possible_player_target.player_current_state != player_states.death) and (possible_player_target.player_current_state != player_states.spawn) {
			enemy_target_player_delay--;
			
			if enemy_target_player_delay <= 0 {
				enemy_target_player = possible_player_target;
			}
		} else {
			enemy_target_player = -1;
			enemy_target_player_delay = enemy_target_player_max_delay;
		}
	} else {
		enemy_target_player = -1;
		enemy_target_player_delay = enemy_target_player_max_delay;
	}
}