/// @description Handle the dialog box update end

if dialog_box_owner != -1 and instance_exists(dialog_box_owner) {
	x = dialog_box_owner.x + dialog_box_x_offset;
	y = dialog_box_owner.y + dialog_box_y_offset;
}