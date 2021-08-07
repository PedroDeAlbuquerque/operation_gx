/// @description Initialize the player bullet object

// Play attack sound
audio_play_sound(snd_shoot, 1, false);
audio_sound_gain(snd_shoot, obj_game_audio_controller.audio_sound_volume, 0);

bullet_owner = -1; // Variable to store the bullet owner for highscore update

bullet_horizontal_direction = 0;