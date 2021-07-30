var player_one = instance_create_layer(400, 200, "Collision_Layer", obj_player_controller);
player_one.player_type = player_kind.samurai;

var player_two = instance_create_layer(600, 200, "Collision_Layer", obj_player_controller);
player_two.player_type = player_kind.ninja;
