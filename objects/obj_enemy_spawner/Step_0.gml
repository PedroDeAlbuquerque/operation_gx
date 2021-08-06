/// @description Handle enemy spawner update

if ds_list_size(enemy_spawner_generated_enemies_list) < 10 {
	if !alarm[0] {
		alarm[0] = irandom_range(60, 180);
	}
}