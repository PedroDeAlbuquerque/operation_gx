/// @description Initialize the player states enum
function scr_player_states_initialize(){
	enum player_states {
		spawn,
		idle,
		sprint,
		attack,
		talk,
		death
	}
}