/// @description Handle sword hitbox update

// Handle sword hitbox collision on enemies
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