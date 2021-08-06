/// @description Initialize the main game doors and set it's teleport destinations

var door_a = instance_create_layer(928, 32, "Collision_Layer", obj_scenery_door);
door_a.door_teleport_x = 1100;
door_a.door_teleport_y = 160;
var door_b = instance_create_layer(1024, 32, "Collision_Layer", obj_scenery_door);
door_b.door_teleport_x = 900;
door_b.door_teleport_y = 160;