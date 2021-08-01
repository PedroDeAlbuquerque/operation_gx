var player_one = instance_create_layer(200, 100, "Collision_Layer", obj_player_controller);
player_one.player_type = player_kind.samurai;
global.camera_view_targets[0] = player_one.id;

var player_two = instance_create_layer(250, 100, "Collision_Layer", obj_player_controller);
player_two.player_type = player_kind.ninja;
global.camera_view_targets[1] = player_two.id;
