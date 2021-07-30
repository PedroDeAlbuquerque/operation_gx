/// @description Handle player animation update end

// Update player animation positioning based on player position
if player_animation_owner != -1 and instance_exists(player_animation_owner) {
	x = player_animation_owner.x;
	y = player_animation_owner.y;
}