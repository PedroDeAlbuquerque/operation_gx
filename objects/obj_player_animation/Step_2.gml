/// @description Handle player animation update end

// Only handle player animation if it's owner does exists
if player_animation_owner != -1 and instance_exists(player_animation_owner) {
	// Handle image facing based on animation owner horizontal speed
	if player_animation_owner.player_horizontal_speed != 0 and player_animation_owner.player_current_state != player_states.death {
		if sign(player_animation_owner.player_horizontal_speed) != sign(image_xscale) {
			image_xscale *= -1;
		}
	}
	
	// Handle player animation based on player current state and type/kind
	switch player_animation_owner.player_current_state {
		case player_states.spawn:
			switch player_animation_owner.player_type {
				case player_kind.robot_samurai:
					sprite_index = spr_player_robot_samurai_spawn;
					break;
				case player_kind.panda:
					sprite_index = spr_player_panda_spawn;
					break;
			}
			break;
		case player_states.idle:
			switch player_animation_owner.player_type {
				case player_kind.robot_samurai:
					sprite_index = spr_player_robot_samurai_idle;
					break;
				case player_kind.panda:
					sprite_index = spr_player_panda_idle;
					break;
			}
			break;
		case player_states.sprint:
			switch player_animation_owner.player_type {
				case player_kind.robot_samurai:
					if not player_animation_owner.player_is_dashing {
						sprite_index = spr_player_robot_samurai_sprint;
					} else {
						sprite_index = spr_player_robot_samurai_dash;
					}
					break;
				case player_kind.panda:
					sprite_index = spr_player_panda_sprint;
					break;
			}
			break;
		case player_states.attack:
			switch player_animation_owner.player_type {
				case player_kind.robot_samurai:
					sprite_index = spr_player_robot_samurai_attack;
					
					// Handle robot samurai first attack
					if (floor(image_index) >= sprite_get_number(sprite_index) - 4) and !player_animation_owner.player_sword_combo_is_being_executed {
						image_index = sprite_get_number(sprite_index) - 4; // Hold first attack frame
						
						with player_animation_owner {
							if player_sword_hitbox == -1 { // Generate sword hitbox if it doesn't exists
								player_sword_hitbox = instance_create_layer(x + (sign(other.image_xscale) * 22), y, "Collision_Layer", obj_player_sword_hitbox);
								player_sword_hitbox.sword_hitbox_owner = id;
							}
							
							player_sword_combo_timer--;
							
							// Normalize attack if player doesn't execute the combo in time
							if player_sword_combo_timer <= 0 {
								player_current_state = player_last_state;
								player_last_state = player_states.attack;
								
								player_sword_combo_timer = player_sword_combo_max_timer;
								player_sword_combo_is_being_executed = false;
							}
							
							// Check for player combo input
							var combo_button_is_pressed = false;
							switch player_buttons_identifier {
								case buttons_identifier.left_group:
									if obj_game_buttons_controller.buttons_leftgroup_attack_key_input {
										combo_button_is_pressed = true;
									}
									break;
								case buttons_identifier.right_group:
									if obj_game_buttons_controller.buttons_rightgroup_attack_key_input {
										combo_button_is_pressed = true;
									}
									break;
							}
							// Execute combo with time gap for better feeling
							if (player_sword_combo_timer <= 10) and combo_button_is_pressed {
								other.image_index = 0;
								player_sword_combo_is_being_executed = true;
								player_sword_combo_timer = player_sword_combo_max_timer;
								instance_destroy(player_sword_hitbox);
								player_sword_hitbox = -1;
							}
						}
					}
					
					// Handle robot samurai second attack if it's executing the attack combo
					if (floor(image_index) >= sprite_get_number(sprite_index) - 6) and player_animation_owner.player_sword_combo_is_being_executed {
						image_index = sprite_get_number(sprite_index) - 6; // Hold pre combo frame
						
						with player_animation_owner {
							player_sword_combo_timer--;
							
							if player_sword_combo_timer <= 0 {
								other.image_index = sprite_get_number(image_index) - 2; // Hold second attack frame
								
								if player_sword_hitbox == -1 { // Generate sword hitbox if it doesn't exists
									player_sword_hitbox = instance_create_layer(x + (sign(other.image_xscale) * 22), y, "Collision_Layer", obj_player_sword_hitbox);
									player_sword_hitbox.sword_hitbox_owner = id;
									
									player_horizontal_speed += sign(other.image_xscale) * player_base_speed;
								}
								
								if player_sword_hitbox != -1 and instance_exists(player_sword_hitbox) { // Handle combo finish when hitbox is already generated
									if player_sword_combo_timer <= -15 {
										player_current_state = player_last_state;
										player_last_state = player_states.attack;
								
										player_sword_combo_timer = player_sword_combo_max_timer;
										player_sword_combo_is_being_executed = false;
									}
								}
							}
						}
					}
					
					break;
				case player_kind.panda:
					sprite_index = spr_player_panda_attack;
					
					// Generate bullet if panda player shooting animation is on correct frame
					if (floor(image_index) == sprite_get_number(sprite_index) - 3) and !player_animation_owner.player_bullet_shot_is_executed {
						// Generate bullet with it's variables
						var bullet_direction = sign(image_xscale);
						var bullet = instance_create_layer(x + (10 * bullet_direction), y - 7, "Collision_Layer", obj_player_bullet);
						bullet.bullet_horizontal_direction = bullet_direction;
						
						// Update image frame and set bullet shot variable to avoid bullet duplication
						image_index++;
						player_animation_owner.player_bullet_shot_is_executed = true;
					}

					break;
			}
			
			// Normalize player state if animation finishes
			if floor(image_index) >= sprite_get_number(sprite_index) - 1 {
				with player_animation_owner {
					player_current_state = player_last_state;
					player_last_state = player_states.attack;
				}
			}
			break;
		case player_states.talk:
			break;
		case player_states.death:
			switch player_animation_owner.player_type {
				case player_kind.robot_samurai:
					sprite_index = spr_player_robot_samurai_death;
					break;
				case player_kind.panda:
					sprite_index = spr_player_panda_death;
					break;
			}
			
			// Hold last frame for death feeling
			if floor(image_index) >= sprite_get_number(sprite_index) - 1 {
				image_index = sprite_get_number(sprite_index) - 1;
				// Handle player respawn based on number of lives
				player_animation_owner.player_lives--; // Decrease player lives
				if player_animation_owner.player_lives <= 0 { // Remove player if lives are decreased enough
					obj_game_camera_controller.camera_split_views_are_combining = true;
					if global.camera_view_targets[0] == player_animation_owner {
						global.camera_view_targets[0] = noone;
					}
					if global.camera_view_targets[1] == player_animation_owner {
						global.camera_view_targets[1] = noone;
					}
					instance_destroy(player_animation_owner);
					
					// Handle highscore showing and gameover here
				} else { // Respawn player if it still have more lives
					with player_animation_owner {
						player_horizontal_speed = 0;
						player_vertical_speed = 0;
						x = player_respawn_x;
						y = player_respawn_y;
						player_current_state = player_states.spawn;
						player_last_state = player_current_state;
					}
				}
			}
			break;
	}
	
	// Update player animation current sprite
	player_animation_current_sprite = sprite_index;
	// Reset sprite animation if player animation last frame sprite is not the same as the current sprite
	if player_animation_last_sprite != player_animation_current_sprite {
		image_index = 0;
		player_animation_last_sprite = player_animation_current_sprite;
	}
	
	// Update player animation positioning based on player position
	x = player_animation_owner.x;
	y = player_animation_owner.y;
}