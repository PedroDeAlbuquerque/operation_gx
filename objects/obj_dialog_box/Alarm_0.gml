/// @description Increase the dialog part text count

var max_count = string_length(dialog_box_text);

dialog_part_text_count++;
dialog_part_text_count = clamp(dialog_part_text_count, 1, max_count);

if not audio_is_playing(snd_dialog) and (dialog_part_text_count < max_count) {
	audio_play_sound(snd_dialog, 1, false);
	audio_sound_gain(snd_dialog, obj_game_audio_controller.audio_sound_volume / 5, 0);
}