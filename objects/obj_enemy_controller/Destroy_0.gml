/// @description Handle enemy clean deletion

if enemy_animation != -1 and instance_exists(enemy_animation) {
	instance_destroy(enemy_animation);
}