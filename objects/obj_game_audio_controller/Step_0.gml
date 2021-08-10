/// @description Turn audio on or off based on player input

if (room != rm_game_init) and (room != rm_intro) {
	// Play music if music audio is on
	if audio_music_is_on {
		if not audio_is_playing(snd_main_song) {
			audio_play_sound(snd_main_song, 0, true);
		}
	} else {
		if audio_is_playing(snd_main_song) {
			audio_stop_sound(snd_main_song);
		}
	}

	// Handle sound volume based on sound switch
	if audio_sound_is_on {
		audio_sound_volume = 1;
	} else {
		audio_sound_volume = 0;
	}

	// Turn music on or off
	if keyboard_check_pressed(vk_f1) {
		if audio_music_is_on {
			audio_music_is_on = false;
		} else {
			audio_music_is_on = true;
		}
	}

	// Turn sound on or off
	if keyboard_check_pressed(vk_f2) {
		if audio_sound_is_on {
			audio_sound_is_on = false;
		} else {
			audio_sound_is_on = true;
		}
	}
}