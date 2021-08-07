/// @description Initialize the strike hitbox

// Play attack sound
audio_play_sound(snd_physical, 1, false);
audio_sound_gain(snd_physical, obj_game_audio_controller.audio_sound_volume, 0);

// Variable to store the strike hitbox owner
strike_hitbox_owner = -1;

// Variable to handle the strike hitbox offset
strike_hitbox_horizontal_offset = 22;
strike_hitbox_vertical_offset = 0;

// Variable to handle the final image x scale of the hitbox
strike_hitbox_final_x_scale = 1;

// Variable to set if hybrid strike hitbox is ready
strike_hitbox_hybrid_is_ready = false;

// Set image alpha
image_alpha = 0;