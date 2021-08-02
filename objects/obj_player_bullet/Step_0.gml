/// @description Handle the player bullet update

// Handle bullet movement
if bullet_horizontal_direction != 0 {
	x += 7 * bullet_horizontal_direction;
}

// Handle bullet collision on enemies
if place_meeting(x, y, obj_enemy_controller) {
	var enemy_list = ds_list_create();
	var number_of_enemies = instance_place_list(x, y, obj_enemy_controller, enemy_list, false);

	if number_of_enemies > 0 {
		for (var i = 0; i < number_of_enemies; i++) {
			// HANDLE ENEMY DEATH LOGIC HERE
			instance_destroy(enemy_list[| i]);
		}
	}

	ds_list_destroy(enemy_list);
}

// Delete bullet if it's outside room
if (x < 0 or x > room_width) or (y < 0 or y > room_height) {
	instance_destroy();
}