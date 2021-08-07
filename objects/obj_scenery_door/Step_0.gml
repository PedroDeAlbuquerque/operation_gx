/// @description Handle the scenery door object update

if door_teleport_x != x or door_teleport_y != y {
	if place_meeting(x, y, obj_player_controller) {
		var player_list = ds_list_create();
		var number_of_players = instance_place_list(x, y, obj_player_controller, player_list, false);

		if number_of_players > 0 {
			for (var i = 0; i < number_of_players; i++) {
				// Handle player death
				var current_player = player_list[| i]; // Get current player being hit by strike
				
				// Teleport player
				current_player.player_screen_flash = -1;
				current_player.player_screen_chromatic_aberration = 1;
				current_player.x = door_teleport_x;
				current_player.y = door_teleport_y;
				
				// Play audio for transition effect
				audio_play_sound(snd_respawn, 1, false);
				audio_sound_gain(snd_respawn, obj_game_audio_controller.audio_sound_volume, 0);
			}
		}

		ds_list_destroy(player_list);
	}
}