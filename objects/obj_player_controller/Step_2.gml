/// @description Handle player object update end

// Handle players animation layer based on which player is on front of the other
var player_one_target = global.camera_view_targets[0];
var player_two_target = global.camera_view_targets[1];
var gothic_girl = obj_npc_gothic_girl_controller;
var top_animation_layer = layer_get_id("Animation_Top_Layer");
var normal_animation_layer = layer_get_id("Animation_Layer");
var bottom_animation_layer = layer_get_id("Animation_Bottom_Layer");
if ( // Handle the two player logic
	(player_one_target != noone and instance_exists(player_one_target)) and 
	(player_two_target != noone and instance_exists(player_two_target))
	) {
	var smallest_y = min(player_one_target.y, player_two_target.y, gothic_girl.y);
	var biggest_y = max(player_one_target.y, player_two_target.y, gothic_girl.y);
	if player_one_target.y <= smallest_y {
		player_one_target.player_animation.layer = bottom_animation_layer;
	} else if player_two_target.y <= smallest_y {
		player_two_target.player_animation.layer = bottom_animation_layer;
	} else if gothic_girl.y <= smallest_y {
		gothic_girl.npc_animation.layer = bottom_animation_layer;
	}
	if player_one_target.y >= biggest_y {
		player_one_target.player_animation.layer = top_animation_layer;
	} else if player_two_target.y >= biggest_y {
		player_two_target.player_animation.layer = top_animation_layer;
	} else if gothic_girl.y >= biggest_y {
		gothic_girl.npc_animation.layer = top_animation_layer;
	}
	if (player_one_target.y > smallest_y) and (player_one_target.y < biggest_y) {
		player_one_target.player_animation.layer = normal_animation_layer;
	} else if (player_two_target.y > smallest_y) and (player_two_target.y < biggest_y) {
		player_two_target.player_animation.layer = normal_animation_layer;
	} else if (gothic_girl.y > smallest_y) and (gothic_girl.y < biggest_y) {
		gothic_girl.npc_animation.layer = normal_animation_layer;
	}
}
if player_two_target == noone and (player_one_target != noone and instance_exists(player_one_target)) { // Handle the player one x gothic girl logic
	if player_one_target.y >= gothic_girl.y {
		player_one_target.player_animation.layer = top_animation_layer;
		gothic_girl.npc_animation.layer = normal_animation_layer;
	} else {
		player_one_target.player_animation.layer = normal_animation_layer;
		gothic_girl.npc_animation.layer = top_animation_layer;
	}
}
if player_one_target == noone and (player_two_target != noone and instance_exists(player_two_target)) { // Handle the player two x gothic girl logic
	if player_two_target.y >= gothic_girl.y {
		player_two_target.player_animation.layer = top_animation_layer;
		gothic_girl.npc_animation.layer = normal_animation_layer;
	} else {
		player_two_target.player_animation.layer = normal_animation_layer;
		gothic_girl.npc_animation.layer = top_animation_layer;
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