/// @description Handle player object update end

// Handle players animation layer based on which player is on front of the other
var player_one_target = global.camera_view_targets[0];
var player_two_target = global.camera_view_targets[1];
if (
	(player_one_target != noone and instance_exists(player_one_target)) and 
	(player_two_target != noone and instance_exists(player_two_target))
	) {
	var top_animation_layer = layer_get_id("Animation_Top_Layer");
	var normal_animation_layer = layer_get_id("Animation_Layer");
	if player_one_target.y >= player_two_target.y {
		player_one_target.player_animation.layer = top_animation_layer;
		player_two_target.player_animation.layer = normal_animation_layer;
	} else {
		player_one_target.player_animation.layer = normal_animation_layer;
		player_two_target.player_animation.layer = top_animation_layer;
	}
}

// Normalize player shader variables
if player_screen_flash != 0 {
	if player_screen_flash < 0 {
		player_screen_flash += .05;
		player_screen_flash = clamp(player_screen_flash, -1, 0);
	}
	if player_screen_flash > 0 {
		player_screen_flash -= .05;
		player_screen_flash = clamp(player_screen_flash, 0, 1);
	}
}
player_screen_chromatic_aberration -= .05;
player_screen_chromatic_aberration = clamp(player_screen_chromatic_aberration, 0, 1);