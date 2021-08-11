/// @description Handle the title screen drawing

// Set font
draw_set_font(fnt_dialog_text);
// Draw title screen text
draw_text(camera_get_view_x(view_camera[0]) + 30, camera_get_view_y(view_camera[0]) + 100, "SUPER AMAZING ROBOT SAMURAI, PANDA AND GOTHIC GIRL\nSPACIAL ADVENTURE");
draw_text(camera_get_view_x(view_camera[0]) + 30, camera_get_view_y(view_camera[0]) + 140, "*may or may not contain ufos*");
// Draw instructions
draw_text(camera_get_view_x(view_camera[0]) + 180, camera_get_view_y(view_camera[0]) + 180, "Press action to begin");
draw_text(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 20, "F1: Toggle music\nF2: Toggle sound\nF3: Toggle screen filter");