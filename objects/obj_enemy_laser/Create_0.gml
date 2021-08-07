/// @description Initialize the enemy laser object

// Play attack sound
audio_play_sound(snd_shoot, 1, false);
audio_sound_gain(snd_shoot, obj_game_audio_controller.audio_sound_volume, 0);

laser_horizontal_direction = 0;