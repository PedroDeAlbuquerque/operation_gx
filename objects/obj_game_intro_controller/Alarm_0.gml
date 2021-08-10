/// @description Increase the intro part text count

if intro_text_phase == 0 {
	var max_count = string_length(intro_text_one);

	intro_part_text_one_count++;
	intro_part_text_one_count = clamp(intro_part_text_one_count, 1, max_count);

	if not audio_is_playing(snd_dialog) and (intro_part_text_one_count < max_count) {
		audio_play_sound(snd_dialog, 1, false);
		audio_sound_gain(snd_dialog, obj_game_audio_controller.audio_sound_volume / 5, 0);
	}
	
	if intro_part_text_one_count >= max_count {
		intro_text_phase = 1;
	}
}

if intro_text_phase == 2 {
	var max_count = string_length(intro_text_two);

	intro_part_text_two_count++;
	intro_part_text_two_count = clamp(intro_part_text_two_count, 1, max_count);

	if not audio_is_playing(snd_dialog) and (intro_part_text_two_count < max_count) {
		audio_play_sound(snd_dialog, 1, false);
		audio_sound_gain(snd_dialog, obj_game_audio_controller.audio_sound_volume / 5, 0);
	}
	
	if intro_part_text_two_count >= max_count {
		intro_text_phase = 3;
	}
}