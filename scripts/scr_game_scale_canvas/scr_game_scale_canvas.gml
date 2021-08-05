/// @description Resize game canvas based on given parameters
/// @param base_width The base width for the game room
/// @param base_height The base height for the game room
/// @param current_width The current width for the game room
/// @param current_height The current height for the game room
/// @param canvas_is_centered Set if the game canvas is centered or not
function scr_game_scale_canvas(argument0, argument1, argument2, argument3, argument4){
	var base_width = argument0;
	var base_height = argument1;
	var current_width = argument2;
	var current_height = argument3;
	var canvas_is_centered = argument4;
	var aspect = (base_width / base_height);
	
	if (current_width / aspect) > current_height {
		window_set_size((current_height * aspect), current_height);
	} else {
		window_set_size(current_width, (current_width / aspect));
	}
	
	if canvas_is_centered {
		window_center();
	}
	
	var final_width = min(window_get_width(), base_width);
	var final_height = min(window_get_height(), base_height);
	
	global.shader_width = final_width;
	global.shader_height = final_height;
	
	surface_resize(application_surface, final_width, final_height);
}