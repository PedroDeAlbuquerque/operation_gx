/// @description Calculate the player bounds and set the camera boundaries globals
function scr_game_camera_calculate_player_bounds(){
	var number_of_players = instance_number(obj_player_controller);
	
	if number_of_players > 0 {
		var player_one = instance_find(obj_player_controller, 0);
		
		var min_x = player_one.x;
		var max_x = player_one.x;
		var min_y = player_one.y;
		var max_y = player_one.y;
		
		for(var i = 0; i < number_of_players; i++) {
			var player_n = instance_find(obj_player_controller, i);
			min_x = min(min_x, player_n.x);
			min_y = min(min_y, player_n.y);
			max_x = max(max_x, player_n.x);
			max_y = max(max_y, player_n.y);
		}
		
		global.camera_full_view_bounds[0] = min_x;
		global.camera_full_view_bounds[1] = min_y;
		global.camera_full_view_bounds[2] = max_x;
		global.camera_full_view_bounds[3] = max_y;
	}
}