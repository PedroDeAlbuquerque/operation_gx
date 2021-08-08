/// @description Handle the gothic girl npc object update

// Handle npc behavior based on current state
switch npc_current_state {
	case npc_states.idle:
		npc_horizontal_speed = 0;
		npc_vertical_speed = 0;
		if !alarm[0] {
			alarm[0] = irandom_range(60, 180)
		}
		break;
	case npc_states.sprint:
		npc_horizontal_speed = npc_base_speed * npc_horizontal_direction;
		npc_vertical_speed = npc_base_speed * npc_vertical_direction;
		if !alarm[0] {
			alarm[0] = irandom_range(60, 180)
		}
		break;
}

// Handle dialog box appearing and disappearing
if distance_to_object(obj_player_controller) < 50 { // Generate dialog box if player is near enough
	if npc_dialog_box == -1 {
		npc_dialog_box = instance_create_layer(x, y, "DialogBox_Layer", obj_dialog_box);
		npc_dialog_box.dialog_box_x_offset = -50;
		npc_dialog_box.dialog_box_y_offset = -60;
		npc_dialog_box.dialog_box_text = "This is just a test textbox";
		npc_dialog_box.dialog_box_owner = id;
	}
} else { // Delete dialog box if player is distant enough
	if npc_dialog_box != -1 and instance_exists(npc_dialog_box) {
		instance_destroy(npc_dialog_box);
		npc_dialog_box = -1;
	}
}

// Handle npc collision and movement based on current speed
repeat(abs(npc_horizontal_speed)) {
	if place_meeting(x + sign(npc_horizontal_speed), y, obj_scenery_wall) {
		npc_horizontal_speed = 0;
		npc_horizontal_direction *= -1;
		break;
	} else {
		x += sign(npc_horizontal_speed);
	}
}
repeat(abs(npc_vertical_speed)) {
	if place_meeting(x, y + sign(npc_vertical_speed), obj_scenery_wall) {
		npc_vertical_speed = 0;
		npc_vertical_direction *= -1;
		break;
	} else {
		y += sign(npc_vertical_speed);
	}
}