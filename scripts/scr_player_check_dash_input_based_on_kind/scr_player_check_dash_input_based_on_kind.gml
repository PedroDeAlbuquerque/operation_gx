/// @description Check for player dash input based on player buttons identifier
function scr_player_check_dash_input_based_on_kind(){
	switch player_buttons_identifier {
		case buttons_identifier.left_group:
			if obj_game_buttons_controller.buttons_leftgroup_dashtalk_key_input {
				player_is_dashing = true;
				player_current_dash_delay = player_max_dash_delay;
				audio_play_sound(snd_dash, 1, false);
				audio_sound_gain(snd_dash, obj_game_audio_controller.audio_sound_volume, 0);
			}
			break;
		case buttons_identifier.right_group:
			if obj_game_buttons_controller.buttons_rightgroup_dashtalk_key_input {
				player_is_dashing = true;
				player_current_dash_delay = player_max_dash_delay;
				audio_play_sound(snd_dash, 1, false);
				audio_sound_gain(snd_dash, obj_game_audio_controller.audio_sound_volume, 0);
			}
			break;
	}
}