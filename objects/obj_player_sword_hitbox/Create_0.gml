/// @description Initialize the sword hitbox

// Play attack sound
audio_play_sound(snd_physical, 1, false);
audio_sound_gain(snd_physical, obj_game_audio_controller.audio_sound_volume, 0);

// Variable to store the sword hitbox owner
sword_hitbox_owner = -1;

// Variable to handle the sword hitbox offset
sword_hitbox_horizontal_offset = 22;

// Set image alpha
image_alpha = 0;