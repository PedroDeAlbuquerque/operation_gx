/// @description Handle enemy generation and add it to the generated enemies list

var generated_enemy_x = irandom_range(x, x + sprite_width);
var generated_enemy_y = irandom_range(y, y + sprite_height);

var generated_enemy = instance_create_layer(generated_enemy_x, generated_enemy_y, "Collision_Layer", obj_enemy_controller);
generated_enemy.enemy_spawner_owner = id;

ds_list_add(enemy_spawner_generated_enemies_list, generated_enemy.id);