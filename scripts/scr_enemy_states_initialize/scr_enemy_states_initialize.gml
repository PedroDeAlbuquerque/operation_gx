/// @description Initialize the enemy states enum
function scr_enemy_states_initialize(){
	enum enemy_states {
		spawn,
		idle,
		sprint,
		attack,
		death
	}
}