/// @description Handle game audio

if not audio_is_playing(snd_main_song) {
	audio_play_sound(snd_main_song, 0, true);
}